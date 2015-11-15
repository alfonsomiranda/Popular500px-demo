//
//  PictureModel.swift
//  Popular500px
//
//  Created by Alfonso Miranda Castro on 14/11/15.
//  Copyright © 2015 Alfonso Miranda Castro. All rights reserved.
//

import UIKit

class PictureModel: NSObject {
    var idPicture: NSNumber?
    var user_id: NSNumber?
    var name: String?
    var picture_description: String?
    var camera: String?
    var lens: String?
    var focal_length: String?
    var iso: String?
    var shutter_speed: String?
    var aperture: String?
    var rating: Double?
    var created_at: String?
    var latitude: Double?
    var longitude: Double?
    var image_url: String?
    var user: UserModel?
    
    init(json:NSDictionary) {
        self.idPicture = json["id"] as! Int
        self.user_id = json["user_id"] as! Int
        self.name = ((json["name"] is NSNull) ? "" : json["name"]) as? String
        self.picture_description = ((json["description"] is NSNull) ? "" : json["description"]) as? String
        self.camera = ((json["camera"] is NSNull) ? "" : json["camera"]) as? String
        self.lens = ((json["lens"] is NSNull) ? "" : json["lens"]) as? String
        self.focal_length = ((json["focal_length"] is NSNull) ? "" : json["focal_length"]) as? String
        self.iso = ((json["iso"] is NSNull) ? "" : json["iso"]) as? String
        self.shutter_speed = ((json["shutter_speed"] is NSNull) ? "" : json["shutter_speed"]) as? String
        self.aperture = ((json["aperture"] is NSNull) ? "" : json["aperture"]) as? String
        self.rating = json["rating"] as? Double
        self.created_at = json["created_at"] as? String
        self.latitude = json["latitude"] as? Double
        self.longitude = json["longitude"] as? Double
        self.image_url = json["image_url"] as? String
        let userDictionary = json["user"] as! NSDictionary
        self.user = UserModel(json: userDictionary)
    }
    
    init(picture:Picture) {
        self.idPicture = picture.id
        self.user_id = picture.user_id
        self.name = picture.name
        self.picture_description = picture.picture_description
        self.camera = picture.camera
        self.lens = picture.lens
        self.focal_length = picture.focal_length
        self.iso = picture.iso
        self.shutter_speed = picture.shutter_speed
        self.aperture = picture.aperture
        self.rating = picture.rating?.doubleValue
        self.created_at = picture.created_at
        self.latitude = picture.latitude?.doubleValue
        self.longitude = picture.longitude?.doubleValue
        self.image_url = picture.image_url
        self.user = UserModel(user: (picture.user)!)
    }

}
