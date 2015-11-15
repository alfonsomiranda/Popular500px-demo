//
//  PopularListInteractor.swift
//  Popular500px
//
//  Created by Alfonso Miranda Castro on 14/11/15.
//  Copyright (c) 2015 Alfonso Miranda Castro. All rights reserved.
//

import UIKit
import CoreData

protocol PopularListInteractorInterface {
    func loadPictures(pictures:NSArray)
}

class PopularListInteractor: NSObject {

    var interface: PopularListInteractorInterface!
    
    
    init(interface: PopularListInteractorInterface) {
        self.interface = interface
    }
    
    func loadPictures() {
        PicturesCommunicator.popularImages { (result) -> Void in
            dispatch_async(dispatch_get_main_queue(),{
                self.interface.loadPictures(result)
            })
        }
    }
}
