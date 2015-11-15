//
//  PopularListPresenter.swift
//  Popular500px
//
//  Created by Alfonso Miranda Castro on 14/11/15.
//  Copyright (c) 2015 Alfonso Miranda Castro. All rights reserved.
//

import UIKit

protocol PopularListPresenterInterface {
    func showPictures(pictures:NSArray)
    func noPictures()
}

class PopularListPresenter: NSObject, PopularListInteractorInterface {
    var viewInterface: PopularListPresenterInterface!
    var interactor: PopularListInteractor!
    var wireframe:MainWireframe!
    
    init(viewInterface: PopularListPresenterInterface) {
        super.init()
        self.viewInterface = viewInterface
        self.interactor = PopularListInteractor(interface: self)
    }
    
    func mainViewIsReady() {
        loadPopularPictures()
    }
    
    func loadPopularPictures() {
        self.interactor.loadPictures()
    }
    
    func navigateToDetail(pictureModel:PictureModel) {
       self.wireframe.openDetail(pictureModel)
    }

    // MARK: - ListProductInteractorInterface
    
    func loadPictures(pictures: NSArray) {
        if pictures.count > 0 {
            self.viewInterface.showPictures(pictures)
        }
        else {
            self.viewInterface.noPictures()
        }
    }
   
}
