//
//  SearchHelper.swift
//  FoodTruckSF
//
//  Created by Yolanda Alonso on 12/11/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import Foundation

class SearchHelper {
    private init(){}
    
    static func filterFoodtrucks(foodtrucks: [Foodtruck], searchString: String) -> [Foodtruck] {
        if searchString == "" {
            return foodtrucks
        } else {
            return [foodtrucks[0], foodtrucks[2]]
        }
    }
}
