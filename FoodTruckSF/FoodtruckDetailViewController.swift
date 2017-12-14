//
//  FoodtruckDetailViewController.swift
//  FoodTruckSF
//
//  Created by Yolanda Alonso on 12/11/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class FoodtruckDetailViewController: UIViewController {
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var schedule: UILabel!
    @IBOutlet weak var products: UITextView!
    
    var foodtruck: Foodtruck!
    var favoriteFoodtrucks: FoodtruckStore!
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        company.text = foodtruck.company
        address.text = foodtruck.address
        schedule.text = foodtruck.dayshours
        products.text = foodtruck.fooditems.replacingOccurrences(of: ":", with: ";")
        
        self.favoriteFoodtrucks = appDelegate.favoriteFoodtrucks
        
        setFavoriteButtonImage()
        
        favoriteButton.addTarget(self, action: #selector(toggleFavorite), for: .touchDown)
        
    }
    
    func setFavoriteButtonImage() {
        if favoriteFoodtrucks.contains(self.foodtruck) {
            favoriteButton.setImage(UIImage(named: "remove-favorite.png"), for: UIControlState.normal)
        } else {
            favoriteButton.setImage(UIImage(named: "add-favorite.png"), for: UIControlState.normal)
        }
    }
    
    @objc func toggleFavorite() {
        favoriteFoodtrucks.toggle(self.foodtruck)
        setFavoriteButtonImage()
    }
    
}
