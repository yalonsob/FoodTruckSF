//
//  MapViewController.swift
//  FoodTruckSF
//
//  Created by Yolanda Alonso on 12/11/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var label: UILabel!
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var foodtrucks: [Foodtruck]!
    var searchString: String!
    var searchedFoodtrucks: [Foodtruck]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.foodtrucks = self.appDelegate.foodtrucks
        self.searchString = self.appDelegate.searchString
        self.searchedFoodtrucks = self.appDelegate.searchedFoodtrucks
        
        searchBar.text = self.searchString
    
        label.text = String(searchedFoodtrucks.count)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.appDelegate.searchString = searchText
        self.searchedFoodtrucks = SearchHelper.filterFoodtrucks(foodtrucks: self.foodtrucks, searchString: searchText)
        self.appDelegate.searchedFoodtrucks = self.searchedFoodtrucks
        
        //Repaint map
        label.text = String(searchedFoodtrucks.count)
    }
    
}
