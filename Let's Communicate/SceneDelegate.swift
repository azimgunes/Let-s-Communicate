//
//  SceneDelegate.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 25.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window?.rootViewController = configureNavigationBar(rootViewController: HomeVC());        window?.makeKeyAndVisible()
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
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
    
    
}

