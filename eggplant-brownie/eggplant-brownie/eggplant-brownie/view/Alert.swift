//
//  Alert.swift
//  eggplant-brownie
//
//  Created by user151798 on 5/19/19.
//  Copyright © 2019 user151798. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    let controller: UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func show(_ title:String = "Sorry", message:String = "Unexpected Error") {
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Understoold", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
}
