//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by user151798 on 5/9/19.
//  Copyright © 2019 user151798. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var happinessField : UITextField!
    
    var delegate : AddAMealDelegate?
    
    var selected = Array<Item>()
    
    var items = [
        Item(name: "Eggplant", calories: 10),
        Item(name: "Brownie", calories: 10),
        Item(name: "Zucchini", calories: 10),
        Item(name: "Muffin", calories: 10),
        Item(name: "Coconut oil", calories: 500),
        Item(name: "Chocolate frosting", calories: 1000),
        Item(name: "Chocolate chip", calories: 1000),
    ]
    
    @IBOutlet var tableView : UITableView?
    
    func add(_ item: Item) {
        items.append(item)
        
        if let table = tableView {
            table.reloadData()
        }
        else {
            Alert(controller: self).show(message: "Unable to update items table")
        }
    }
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "new item",
                                            style: UIBarButtonItem.Style.plain, target: self,
                                            action: #selector(showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    @objc func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem,
                                          animated: true)
        }
        else{
            Alert(controller: self).show()
        }
        
        print("new item...")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if (cell.accessoryType == UITableViewCell.AccessoryType.none) {
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                let item = items[indexPath.row]
                selected.append(item)
            }
            else {
                cell.accessoryType = UITableViewCell.AccessoryType.none
                let item = items[indexPath.row]
                let position = selected.index(of: item)
                selected.remove(at: position!)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default,
                                   reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        return cell
    }

    @IBAction func add() {
        if (nameField == nil || happinessField == nil) {
            return
        }
        let name:String = nameField.text!
        
        if let happiness:Int = Int(happinessField.text!) {
            let meal = Meal(name: name, happiness: happiness,
                            items: self.selected)
            //meal.items = selected
        
            print("eaten \(meal.name) with \(meal.happiness) with \(meal.items)!")
            
            if (delegate == nil) {
                return
            }
            
            delegate!.add(meal)
            
            if navigationController != nil {
                navigationController?.popViewController(animated: true)
            }
        }
    }

}

