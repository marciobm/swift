//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by user151798 on 5/17/19.
//  Copyright © 2019 user151798. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
   
    var delegate:AddAnItemDelegate?
    
    init(delegate: AddAnItemDelegate) {
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var caloriesField: UITextField?
    
    
    @IBAction func addNewItem() {
        print("adding new item")
        
        let name = nameField!.text
        let calories = Double(caloriesField!.text!)
        
        if name == nil || calories == nil {
            return
        }
        
        let item = Item(name: name!, calories: calories!)
        delegate!.add(item)
        
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
