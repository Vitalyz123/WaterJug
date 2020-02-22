//
//  AppDelegate.swift
//  WaterJug
//
//  Created by Vitalii Zaitcev on 2/21/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navigationController = UINavigationController.init()
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let vc = MainViewController()
        navigationController.pushViewController(vc, animated: true)

        return true
    }
}

