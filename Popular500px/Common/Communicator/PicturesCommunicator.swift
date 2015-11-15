//
//  500pxCommunicator.swift
//  Popular500px
//
//  Created by Alfonso Miranda Castro on 14/11/15.
//  Copyright (c) 2015 Alfonso Miranda Castro. All rights reserved.
//

import UIKit

class PicturesCommunicator: NSObject {
    
    static let url = "https://api.500px.com/v1/photos?feature=popular&sort=rating&page=1&image_size=3&include_states=voted&consumer_key=9nVc9Eu7fAHthlDWtKzJoZsKj8tDDzMI4wBMl2Qt"
    
    static func popularImages(completion: (result: NSArray) -> Void) {
        let request = NSURLRequest(URL: NSURL(string: url)!)
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithRequest(request) {
            (let data: NSData?, let response: NSURLResponse?, let error: NSError?) -> Void in
            
            guard let httpResponse = response as? NSHTTPURLResponse, receivedData = data
            else {
                restoreCache(completion)
                return
            }
            
            switch (httpResponse.statusCode) {
            case 200:
                do {
                let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(receivedData, options: NSJSONReadingOptions.AllowFragments)
                as? [String:AnyObject]
                    let pictureResponse = PictureResponse(json: jsonDictionary!)
                    let picturesArray = pictureResponse.pictureArray
                    DataManager.saveArrayPicture(picturesArray)
                    completion(result: picturesArray)
                } catch {
                    restoreCache(completion)
                }
            default:
                restoreCache(completion)
            }
        }
        dataTask.resume()
    }
    
    static private func restoreCache(completion: (result: NSArray) -> Void) {
        let picturesArray = DataManager.loadAllPictures()
        completion(result: picturesArray)
    }
}
