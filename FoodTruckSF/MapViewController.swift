//
//  MapViewController.swift
//  FoodTruckSF
//
//  Created by Yolanda Alonso on 12/11/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, UISearchBarDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var map: MKMapView!
    
    let manager = CLLocationManager()
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var foodtrucks: [Foodtruck]!
    var searchString: String!
    var searchedFoodtrucks: [Foodtruck]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.foodtrucks = self.appDelegate.foodtrucks
        self.searchString = self.appDelegate.searchString
        self.searchedFoodtrucks = self.appDelegate.searchedFoodtrucks
        
        searchBar.text = self.searchString
    
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.appDelegate.searchString = searchText
        self.searchedFoodtrucks = SearchHelper.filterFoodtrucks(foodtrucks: self.foodtrucks, searchString: searchText)
        self.appDelegate.searchedFoodtrucks = self.searchedFoodtrucks
        
        //Repaint map
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.03, 0.03)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
        
        self.map.showsUserLocation = true
    }
    
}
