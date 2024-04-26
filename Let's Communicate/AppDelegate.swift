//
//  AppDelegate.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 25.03.2024.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: HomeVC())
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        window = UIWindow()
        return true
        
    }
    
    
}

