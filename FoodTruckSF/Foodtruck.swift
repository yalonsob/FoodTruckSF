//
//  Foodtruck.swift
//  FoodTruckSF
//
//  Created by Yolanda Alonso on 12/11/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class Foodtruck {
    
    var address: String
    var company: String
    var dayshours: String
    var fooditems: String
    var latitude: Double
    var longitude: Double
    
    // Init from a dictionary.
    init?(dictionary: [String : AnyObject]) {
        
        
        // Mandatory values
        guard
            let address = dictionary["address"] as? String,
            let company = dictionary["applicant"] as? String,
            let latitude = (dictionary["latitude"] as? NSString)?.doubleValue,
            let longitude = (dictionary["longitude"] as? NSString)?.doubleValue
            else {
                return nil
        }
        
        let dayshours = dictionary["dayshours"] as? String ?? ""
        let fooditems = dictionary["fooditems"] as? String ?? ""
        
        // Put the extracted values into the properties
        self.address = address
        self.company = company
        self.dayshours = dayshours
        self.fooditems = fooditems
        self.latitude = latitude
        self.longitude = longitude
    }
}

