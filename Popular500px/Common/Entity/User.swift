//
//  User.swift
//  Popular500px
//
//  Created by Alfonso Miranda Castro on 14/11/15.
//  Copyright © 2015 Alfonso Miranda Castro. All rights reserved.
//

import Foundation
import CoreData

@objc(User)
class User: NSManagedObject {

    func parseUserModel(userModel:UserModel, picture:Picture) {
        self.user_id = userModel.user_id
        self.city = userModel.city
        self.country = userModel.country
        self.cover_url = userModel.cover_url
        self.firstname = userModel.firstname
        self.fullname = userModel.fullname
        self.lastname = userModel.lastname
        self.username = userModel.username
        self.userpic_url = userModel.userpic_url
        self.picture = picture
    }

}
