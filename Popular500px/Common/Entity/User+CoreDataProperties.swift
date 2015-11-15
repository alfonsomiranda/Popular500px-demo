//
//  User+CoreDataProperties.swift
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

extension User {

    @NSManaged var city: String?
    @NSManaged var country: String?
    @NSManaged var cover_url: String?
    @NSManaged var firstname: String?
    @NSManaged var fullname: String?
    @NSManaged var lastname: String?
    @NSManaged var user_id: NSNumber?
    @NSManaged var username: String?
    @NSManaged var userpic_url: String?
    @NSManaged var picture: Picture?

}
