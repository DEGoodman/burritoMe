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
        let myLoc = getLoc()
        print(myLoc)
        getBur(myLoc)
        
    }
    
    @IBAction func launchTinder(sender: UIButton) {
        let myLoc = getLoc()
        lat.text = "\(myLoc.coordinate.longitude)"
        lng.text = "\(myLoc.coordinate.latitude)"
    }
    

    func getLoc()-> CLLocation {
        //prod
        
        /*
        let locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        
        var currentLocation = CLLocation()
        
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse){
            
            currentLocation = locManager.location!
            
            lat.text = "\(currentLocation.coordinate.longitude)"
            lng.text = "\(currentLocation.coordinate.latitude)"
            return currentLocation
        } else {
            //this is bad (defaults to Phoenix)
            return CLLocation(latitude: 33.4484, longitude: -112.0740)
        }
        */
        
        //dev - Phoenix
        return CLLocation(latitude: 33.4484, longitude: -112.0740)
    }
    
    func getBur(location: CLLocation) {
        // api style: https://api.yelp.com/v2/search?term=food&ll=37.788022,-122.399797
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        let url = "?term=burrito&ll=\(lat),\(lng)&limit=5"
        
        let client = YelpAPIClient()
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
            for x in  0..<5 {
                if let bus = json["businesses"][x]["name"].string {
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

