//
//  LaunchViewController.swift
//  burritoMe
//
//  Created by David Goodman on 5/21/16.
//  Copyright © 2016 David Goodman. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyJSON

class LaunchViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var lat: UITextField!
    @IBOutlet weak var lng: UITextField!
    
    @IBAction func launchTable(sender: UIButton) {
        getLoc()
        getBur()
        
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
    
    func getBur() {

        let client = YelpAPIClient()
        

//        https://api.yelp.com/v2/search?term=food&ll=37.788022,-122.399797
        let url = "?term=burrito&ll=33.4484,-112.0740&limit=5"
        
        
        client.searchPlacesbyUrl(url, successSearch: { (data, response) -> Void in
            self.parseResults(NSString(data: data, encoding: NSUTF8StringEncoding)!)
            }, failureSearch: { (error) -> Void in
                print(error)
        })
        
    }
    
    func parseResults(results:NSString){
        // convert to json
        var businesses = "businesses:\n"
        if let dataFromString = results.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            for var i = 0; i < 5; ++i {
                if let bus = json["businesses"][i]["name"].string {
                    businesses += "\t\(bus)\n"
                }
            }
        }
       print(businesses)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

