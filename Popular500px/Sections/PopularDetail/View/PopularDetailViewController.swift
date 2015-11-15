//
//  PopularDetailViewController.swift
//  Popular500px
//
//  Created by Alfonso Miranda Castro on 14/11/15.
//  Copyright © 2015 Alfonso Miranda Castro. All rights reserved.
//

import UIKit
import MapKit

class PopularDetailViewController: UIViewController {

    @IBOutlet var mapView:MKMapView!
    @IBOutlet var titlePictureLabel:UILabel!
    @IBOutlet var descriptionPictureLabel:UILabel!
    @IBOutlet var cameraDetailsLabel:UILabel!
    @IBOutlet var usernameLabel:UILabel!
    @IBOutlet var userPictureImageView:UIImageView!
    
    var pictureModel:PictureModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeView() {
        if (self.pictureModel.longitude != nil && self.pictureModel.latitude != nil) {
            self.mapView.hidden = false
            let initialLocation = CLLocation(latitude: self.pictureModel.latitude!, longitude: self.pictureModel.longitude!)
            
            centerMapOnLocation(initialLocation)
            let location = PictureLocation(title: "Picture", coordinate: CLLocationCoordinate2D(latitude: self.pictureModel.latitude!, longitude: pictureModel.longitude!), info: "")
            mapView.addAnnotation(location)
        }
        else {
            self.mapView.hidden = true
        }
        
        self.titlePictureLabel.numberOfLines = 0
        self.descriptionPictureLabel.numberOfLines = 0
        self.cameraDetailsLabel.numberOfLines = 0
        self.titlePictureLabel.text = self.pictureModel.name
        self.descriptionPictureLabel.text = self.pictureModel.picture_description
        
        self.cameraDetailsLabel.text = "\(self.pictureModel.camera!) \n \(self.pictureModel.lens!) \n \(self.pictureModel.focal_length!) \(self.pictureModel.iso!) \(self.pictureModel.shutter_speed!) \(self.pictureModel.aperture!)"
        self.usernameLabel.text = self.pictureModel.user?.username
        self.userPictureImageView.layer.cornerRadius = self.userPictureImageView.frame.height/2
        self.userPictureImageView.clipsToBounds = true

        let url = NSURL(string: (self.pictureModel.user?.userpic_url)!)
        self.userPictureImageView.sd_setImageWithURL(url, completed: nil)
        
        animateView()
    }
    
    // MARK: - Private

    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func animateView() {
        self.userPictureImageView.alpha = 0
        self.usernameLabel.alpha = 0
        UIView.animateWithDuration(0.2, delay: 0.5, options: .CurveEaseOut, animations: {
            self.userPictureImageView.alpha = 1
            }, completion: { finished in
                UIView.animateWithDuration(0.2, delay: 0.0, options: .CurveEaseOut, animations: {
                    self.usernameLabel.alpha = 1
                    }, completion: { finished in
                        print("Animation completed!")
                })
        })

    }

}
