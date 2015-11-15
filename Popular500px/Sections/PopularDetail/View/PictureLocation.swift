//
//  PictureLocation.swift
//  Popular500px
//
//  Created by Alfonso Miranda Castro on 14/11/15.
//  Copyright © 2015 Alfonso Miranda Castro. All rights reserved.
//

import UIKit
import MapKit

class PictureLocation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}