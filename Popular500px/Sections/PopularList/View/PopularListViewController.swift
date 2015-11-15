//
//  PopularListViewController.swift
//  Popular500px
//
//  Created by Alfonso Miranda Castro on 14/11/15.
//  Copyright (c) 2015 Alfonso Miranda Castro. All rights reserved.
//

import UIKit

class PopularListViewController: UIViewController, PopularListPresenterInterface, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var picturesTableView:UITableView!
    @IBOutlet var loadingView:UIView!
    @IBOutlet var noPicturesLabel:UILabel!
    var presenter:PopularListPresenter!
    var pictures:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "500px"
        self.noPicturesLabel.text = "No pictures"
        self.noPicturesLabel.hidden = true
        self.pictures = NSArray()
//        self.presenter = PopularListPresenter(viewInterface: self)
        self.presenter.mainViewIsReady()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pictures.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.registerNib(UINib(nibName: "PopularPictureCell", bundle: nil), forCellReuseIdentifier: "PictureCell")
        let cell = tableView.dequeueReusableCellWithIdentifier("PictureCell") as! PopularPictureCell
        let picture = self.pictures[indexPath.row] as? PictureModel
        
        let url = NSURL(string: (picture?.image_url)!)
        
        cell.pictureImage!.sd_setImageWithURL(url, completed: nil)
        
        cell.pictureName?.text = picture?.name
        cell.ratingLabel?.text = String(format: "%.1f", picture!.rating!)
        return cell
    }
    
    // MARK: - UITableViewDelegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let picture = self.pictures[indexPath.row] as! PictureModel
        self.presenter.navigateToDetail(picture)
    }
    
    // MARK: - PopularListPresenterInterface
    
    func showPictures(pictures: NSArray) {
        self.pictures = pictures
        self.picturesTableView.reloadData()
        self.loadingView.hidden = true
        self.noPicturesLabel.hidden = true
        self.picturesTableView.hidden = false
    }

    func noPictures() {
        self.loadingView.hidden = true
        self.noPicturesLabel.hidden = false
        self.picturesTableView.hidden = true
    }
}
