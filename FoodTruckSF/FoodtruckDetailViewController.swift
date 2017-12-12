//
//  FoodtruckDetailViewController.swift
//  FoodTruckSF
//
//  Created by Yolanda Alonso on 12/11/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class FoodtruckDetailViewController: UIViewController {
    
    
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var schedule: UILabel!
    @IBOutlet weak var products: UITextView!
    
    var foodtruck: Foodtruck!
    
    override func viewDidLoad() {
        company.text = foodtruck.company
        address.text = foodtruck.address
        schedule.text = foodtruck.dayshours
        products.text = foodtruck.fooditems.replacingOccurrences(of: ":", with: ";")
    }
    
}
