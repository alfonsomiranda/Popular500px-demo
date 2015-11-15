//
//  Picture.swift
//  Popular500px
//
//  Created by Alfonso Miranda Castro on 14/11/15.
//  Copyright © 2015 Alfonso Miranda Castro. All rights reserved.
//

import Foundation
import CoreData

@objc(Picture)
class Picture: NSManagedObject {
    
    func parsePictureModel(pictureModel:PictureModel) {
        self.id = pictureModel.idPicture
        self.user_id = pictureModel.user_id
        self.name = pictureModel.name
        self.picture_description = pictureModel.picture_description
        self.camera = pictureModel.camera
        self.lens = pictureModel.lens
        self.focal_length = pictureModel.focal_length
        self.iso = pictureModel.iso
        self.shutter_speed = pictureModel.shutter_speed
        self.aperture = pictureModel.aperture
        self.rating = pictureModel.rating
        self.created_at = pictureModel.created_at
        self.latitude = pictureModel.latitude
        self.longitude = pictureModel.longitude
        self.image_url = pictureModel.image_url
        //self.user
        let userEntity = NSEntityDescription.entityForName("User", inManagedObjectContext: managedObjectContext!)
        let user = NSManagedObject(entity: userEntity!, insertIntoManagedObjectContext: managedObjectContext!) as! User
        user.parseUserModel(pictureModel.user!, picture: self)
    }
}
