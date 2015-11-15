//
//  Picture+CoreDataProperties.swift
//  Popular500px
//
//  Created by Alfonso Miranda Castro on 15/11/15.
//  Copyright © 2015 Alfonso Miranda Castro. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Picture {

    @NSManaged var aperture: String?
    @NSManaged var camera: String?
    @NSManaged var created_at: String?
    @NSManaged var focal_length: String?
    @NSManaged var id: NSNumber?
    @NSManaged var image_url: String?
    @NSManaged var iso: String?
    @NSManaged var latitude: NSNumber?
    @NSManaged var lens: String?
    @NSManaged var longitude: NSNumber?
    @NSManaged var name: String?
    @NSManaged var picture_description: String?
    @NSManaged var rating: NSNumber?
    @NSManaged var shutter_speed: String?
    @NSManaged var user_id: NSNumber?
    @NSManaged var user: User?

}
