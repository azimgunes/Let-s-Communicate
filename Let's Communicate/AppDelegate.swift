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
        window?.rootViewController = configureNavigationBar(rootViewController: HomeVC())
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        window = UIWindow()
        return true
        
    }
    
    private func configureNavigationBar(rootViewController: UIViewController) -> UINavigationController{
        let controller = UINavigationController(rootViewController: rootViewController)
        let appearence = UINavigationBarAppearance()
        appearence.configureWithDefaultBackground()
        controller.navigationBar.standardAppearance = appearence
        controller.navigationBar.compactAppearance = appearence
        controller.navigationBar.scrollEdgeAppearance = appearence
        controller.navigationBar.compactScrollEdgeAppearance = appearence
        
        return controller
        
    }
    
    
}

