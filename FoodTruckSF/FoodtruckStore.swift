//
//  FoodtruckStore.swift
//  FoodTruckSF
//
//  Created by Yolanda Alonso on 12/14/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import Foundation

class FoodtruckStore {
    let name: String
    var foodtrucks: [Foodtruck]
    
    init(_ name: String) {
        self.name = name
        self.foodtrucks = []
        
        if let data = try? Data(contentsOf: fileURL) {
            print(fileURL)
            let dictionaries = try! JSONSerialization.jsonObject(with: data) as! [[String : Any]]
            
            for d in dictionaries {
                foodtrucks.append(Foodtruck(dictionary: d)!)
            }
        }
    }
    
    func add(_ f: Foodtruck) {
        foodtrucks.append(f)
        persist()
    }
    
    func remove(_ f: Foodtruck) {
        foodtrucks = foodtrucks.filter(){
            $0.company != f.company || $0.address != f.address
        }
        persist()
    }
    
    func remove(at index: Int) {
        foodtrucks.remove(at: index)
        persist()
    }
    
    func contains(_ f: Foodtruck) -> Bool {
        return foodtrucks.contains(where: {
            $0.company == f.company && $0.address == f.address
        })
    }
    
    func toggle(_ f: Foodtruck) {
        if self.contains(f) {
            self.remove(f)
        } else {
            self.add(f)
        }
    }
    
    func persist() {
        var dictionaries = [[String : Any]]()
        
        for f in self.foodtrucks {
            dictionaries.append(f.dictionary)
        }
        
        let data = try! JSONSerialization.data(withJSONObject: dictionaries)
        
        try! data.write(to: self.fileURL)
        
        print(fileURL)
    }
    
    private var fileURL: URL {
        let documentDirectory = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask,
                                    appropriateFor: nil, create: false)
        return documentDirectory.appendingPathComponent(name)
    }
}
