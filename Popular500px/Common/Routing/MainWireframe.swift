//
//  MainWireframe.swift
//  Popular500px
//
//  Created by Alfonso Miranda Castro on 15/11/15.
//  Copyright © 2015 Alfonso Miranda Castro. All rights reserved.
//

import UIKit

class MainWireframe: NSObject {
    let popularViewController:PopularListViewController = PopularListViewController(nibName:"PopularListViewController", bundle:nil)
    var navigationController: UINavigationController?
    var presenter:PopularListPresenter!
    
    override init() {
        super.init()
        presenter = PopularListPresenter(viewInterface: popularViewController)
        self.popularViewController.presenter = presenter
        navigationController = UINavigationController(rootViewController: self.popularViewController)
        presenter.wireframe = self
    }
    
    func openDetail(pictureModel:PictureModel) {
        let detailViewController = PopularDetailViewController(nibName:"PopularDetailViewController", bundle:nil)
        detailViewController.pictureModel = pictureModel
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    func hola() {}
}
