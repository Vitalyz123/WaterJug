//
//  UIViewController+Extension.swift
//  WaterJug
//
//  Created by Vitalii Zaitcev on 2/21/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
