//
//  MapViewController.swift
//  FoodTruckSF
//
//  Created by Yolanda Alonso on 12/11/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    var foodtrucks: [Foodtruck]!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.foodtrucks = appDelegate.foodtrucks
        
        label.text = String(foodtrucks.count)
    }
    
}
