//
//  Burrito.swift
//  burritoMe
//
//  Created by David Goodman on 5/21/16.
//  Copyright © 2016 David Goodman. All rights reserved.
//

import UIKit
import CoreLocation

class Burrito {
    // MARK: Properties
    
    var name: String
    var loc: CLLocation
    var dist: Int
    
    // MARK: Initialization
    init?(name: String, loc: CLLocation, dist: Int) {
        self.name = name
        self.loc = loc
        self.dist = dist
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty  {
            return nil
        }
    }
}
