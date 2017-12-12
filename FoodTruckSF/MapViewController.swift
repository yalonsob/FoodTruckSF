//
//  MapViewController.swift
//  FoodTruckSF
//
//  Created by Yolanda Alonso on 12/11/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var label: UILabel!
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var foodtrucks: [Foodtruck]!
    var searchString: String!
    var searchedFoodtrucks: [Foodtruck]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //searchBar.text = self.searchString
        self.foodtrucks = self.appDelegate.foodtrucks
        self.searchString = self.appDelegate.searchString
        self.searchedFoodtrucks = self.appDelegate.searchedFoodtrucks
        
        searchBar.text = self.searchString
        
        label.text = String(foodtrucks.count)
    }
    
}
