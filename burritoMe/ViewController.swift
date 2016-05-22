//
//  ViewController.swift
//  burritoMe
//
//  Created by David Goodman on 5/21/16.
//  Copyright © 2016 David Goodman. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var lat: UITextField!
    @IBOutlet weak var lng: UITextField!
    
    @IBAction func launchBut(sender: UIButton) {
        let locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        
        var currentLocation = CLLocation()
        
        // prod
//        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse){
//            
//            currentLocation = locManager.location!
//            
//        }
//        if (currentLocation){
//            lat.text = "\(currentLocation.coordinate.longitude)"
//            lng.text = "\(currentLocation.coordinate.latitude)"
//        } else {
//            lat.text = "fail";
//            lng.text = "fail";
//        }
        
        // dev
        let myLocation = CLLocation(latitude: 33.4484, longitude: 112.0740)
        currentLocation = myLocation;
        
        lat.text = "\(currentLocation.coordinate.longitude)"
        lng.text = "\(currentLocation.coordinate.latitude)"

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

