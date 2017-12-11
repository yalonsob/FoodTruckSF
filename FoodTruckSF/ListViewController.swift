//
//  ViewController.swift
//  FoodTruckSF
//
//  Created by Yolanda Alonso on 11/30/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var foodtrucks: [Foodtruck] = [Foodtruck]()

    override func viewDidLoad() {
        let url = URL(string: "https://data.sfgov.org/resource/6a9r-agq8.json?status=APPROVED")!
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            // Simple error handling
            if let error = error {
                print(error)
                return
            }
            
            // Update the view controller's state
            self.foodtrucks = self.foodtrucksFromData(data)
            
            // Send the UI Updating work back to the main thread
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodtrucks.count
    }
    
    //var cellNumber = 0
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodtruckCell", for: indexPath) as! FoodTruckTableViewCell
        let foodtruck = foodtrucks[indexPath.row]
        cell.company.text = foodtruck.company
        cell.address.text = foodtruck.address
        
        return cell
    }
    
    func foodtrucksFromData(_ data: Data?) -> [Foodtruck] {
        
        // No data, return an empty array
        guard let data = data else {
            return []
        }
        
        // Parse the Data into a JSON Object
        let JSONObject = try! JSONSerialization.jsonObject(with: data)
        
        // Insist that this object must be a dictionary
        guard let dictionaries = JSONObject as? [[String : AnyObject]] else {
            assertionFailure("Failed to parse data. data.length: \(data.count)")
            return [Foodtruck]()
        }
        
        // This is where we will put the foodtrucks. We will return this array.
        var foodtrucks = [Foodtruck]()
        
        // For each dictionary...
        for d in dictionaries {
            
            // Make a foodtruck...
            let f = Foodtruck(dictionary: d)!
            // Put it into the array that we will return
            foodtrucks.append(f)
        }
        return foodtrucks
    }

}

