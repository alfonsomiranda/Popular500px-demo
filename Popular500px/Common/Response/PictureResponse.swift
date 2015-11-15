//
//  PictureResponse.swift
//  Popular500px
//
//  Created by Alfonso Miranda Castro on 14/11/15.
//  Copyright © 2015 Alfonso Miranda Castro. All rights reserved.
//

import UIKit

class PictureResponse: NSObject {
    var pictureArray:[PictureModel]
    
    init(json:NSDictionary) {
        let imageArray = json["photos"] as! NSArray
        var pictureModelArray = [PictureModel]()
        for picture in imageArray {
            let pictureModel = PictureModel(json: picture as! NSDictionary)
            pictureModelArray.append(pictureModel)
        }
        self.pictureArray = pictureModelArray
    }
    
}
