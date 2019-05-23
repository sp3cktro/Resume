//
//  AppDelegate.swift
//  Resume
//
//  Created by specktro on 5/21/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

@UIApplicationMain

// MARK: - AppDelegate class
class AppDelegate: UIResponder, UIApplicationDelegate {
    var coordinator: MainCoordinator?
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.coordinator = MainCoordinator(window: window!)
        window?.makeKeyAndVisible()
        
        return true
    }
}
