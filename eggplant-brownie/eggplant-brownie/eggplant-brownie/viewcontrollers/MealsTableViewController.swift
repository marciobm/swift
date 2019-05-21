//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by user151798 on 5/14/19.
//  Copyright © 2019 user151798. All rights reserved.
//

import UIKit
class MealsTableViewController : UITableViewController, AddAMealDelegate {
    
    var meals = [Meal(name: "Batata Frita", happiness: 5), Meal(name: "Bolo de Chocolate", happiness: 4), Meal(name: "Beirute", happiness: 4)]
    
    func add(_ meal:Meal) {
        print("adding \(meal.name)")
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("MealsTableViewController")
        if (segue.identifier == "addMeal") {
            let view:ViewController = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default,                               reuseIdentifier:nil)
        cell.textLabel!.text = meal.name
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        cell.addGestureRecognizer(longPressRecognizer)
        
        return cell
    }
    
    @objc func showDetails(recognizer: UILongPressGestureRecognizer) {
        if (recognizer.state == UIGestureRecognizer.State.began) {
            let cell = recognizer.view as! UITableViewCell
            
            if let indexPath = tableView.indexPath(for: cell) {
                let row = indexPath.row
                let meal = meals[row]

                let detail = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertController.Style.alert)
                
                let ok = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
                
                detail.addAction(ok)
                
                present(detail, animated: true, completion: nil)
            }
        }
    }
}
