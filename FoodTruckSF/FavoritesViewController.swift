//
//  FavoritesViewController.swift
//  FoodTruckSF
//
//  Created by Yolanda Alonso on 12/14/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var favoriteFoodtrucks: FoodtruckStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.favoriteFoodtrucks = appDelegate.favoriteFoodtrucks
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteFoodtrucks.foodtrucks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteTableViewCell
        let foodtruck = favoriteFoodtrucks.foodtrucks[indexPath.row]
        cell.company.text = foodtruck.company
        cell.address.text = foodtruck.address
        return cell
    }
    
    
}
