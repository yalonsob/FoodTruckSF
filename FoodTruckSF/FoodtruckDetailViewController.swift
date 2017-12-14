//
//  FoodtruckDetailViewController.swift
//  FoodTruckSF
//
//  Created by Yolanda Alonso on 12/11/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit
import MapKit

class FoodtruckDetailViewController: UIViewController {
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var schedule: UILabel!
    @IBOutlet weak var products: UITextView!
    @IBOutlet weak var map: MKMapView!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        map.removeAnnotations(map.annotations)
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(foodtruck.latitude, foodtruck.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = foodtruck.company
        annotation.subtitle = foodtruck.dayshours
        map.addAnnotation(annotation)
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
