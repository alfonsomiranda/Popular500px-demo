//
//  UserModel.swift
//  Popular500px
//
//  Created by Alfonso Miranda Castro on 15/11/15.
//  Copyright © 2015 Alfonso Miranda Castro. All rights reserved.
//

import UIKit

class UserModel: NSObject {
    var user_id: NSNumber?
    var username: String?
    var firstname: String?
    var lastname: String?
    var city: String?
    var country: String?
    var fullname: String?
    var userpic_url: String?
    var cover_url: String?
    
    init(json:NSDictionary) {
        self.user_id = json["id"] as! Int
        self.username = ((json["username"] is NSNull) ? "" : json["username"]) as? String
        self.firstname = ((json["firstname"] is NSNull) ? "" : json["firstname"]) as? String
        self.lastname = ((json["lastname"] is NSNull) ? "" : json["lastname"]) as? String
        self.city = ((json["city"] is NSNull) ? "" : json["city"]) as? String
        self.country = ((json["country"] is NSNull) ? "" : json["country"]) as? String
        self.fullname = ((json["fullname"] is NSNull) ? "" : json["fullname"]) as? String
        self.userpic_url = ((json["userpic_url"] is NSNull) ? "" : json["userpic_url"]) as? String
        self.cover_url = ((json["cover_url"] is NSNull) ? "" : json["cover_url"]) as? String
    }
    
    init(user:User) {
        self.user_id = user.user_id
        self.username = user.username
        self.firstname = user.firstname
        self.lastname = user.lastname
        self.city = user.city
        self.country = user.country
        self.fullname = user.fullname
        self.userpic_url = user.userpic_url
        self.cover_url = user.cover_url
    }
}
