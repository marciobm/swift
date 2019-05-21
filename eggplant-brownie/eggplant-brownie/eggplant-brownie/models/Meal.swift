//
//  Meal.swift
//  eggplant-brownie
//
//  Created by user151798 on 5/12/19.
//  Copyright © 2019 user151798. All rights reserved.
//

import Foundation

class Meal {
    
    let name:String
    let happiness:Int
    var items = Array<Item>()
    
    
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
        self.items = []
    }
    
    init(name:String, happiness:Int, items: Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    func allCalories() -> Double {
        var total = 0.0
        for item in items {
            total += item.calories
        }
        return total
    }
    
    func details() -> String {
        var message = "Happiness: \(happiness)\n"
        for item in items {
            message += "\(item.name) - Calories \(item.calories)\n"
        }
        return message
    }
}
