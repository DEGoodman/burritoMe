//
//  LaunchViewController.swift
//  burritoMe
//
//  Created by David Goodman on 5/21/16.
//  Copyright © 2016 David Goodman. All rights reserved.
//

import UIKit
import CoreLocation

class LaunchViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var lat: UITextField!
    @IBOutlet weak var lng: UITextField!
    
    @IBAction func launchTable(sender: UIButton) {
        let myLoc = getLoc()
        lat.text = "\(myLoc.coordinate.longitude)"
        lng.text = "\(myLoc.coordinate.latitude)"
    }
    
    @IBAction func launchTinder(sender: UIButton) {
        let myLoc = getLoc()
        lat.text = "\(myLoc.coordinate.longitude)"
        lng.text = "\(myLoc.coordinate.latitude)"
    }
    

    func getLoc()-> CLLocation {
        //prod
        
//        let locManager = CLLocationManager()
//        locManager.requestWhenInUseAuthorization()
//        
//        var currentLocation = CLLocation()
//        
//        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse){
//            
//            currentLocation = locManager.location!
//            
//            lat.text = "\(currentLocation.coordinate.longitude)"
//            lng.text = "\(currentLocation.coordinate.latitude)"
//            return currentLocation
//        } else {
//            return null
//        }

        
        //dev (Phoenix)
        return CLLocation(latitude: 33.4484, longitude: 112.0740)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

