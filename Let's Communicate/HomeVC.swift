//
//  HomeVC.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 24.04.2024.
//

import UIKit
import FirebaseAuth


class HomeVC: UIViewController {
    
    //MARK: Properties
    
    private var chatsButton: UIBarButtonItem!
    private var messageScreen: UIBarButtonItem!
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        //signOut()
        AuthStatus()
        
    }
    
}


//MARK: Helpers

extension HomeVC {
    
    private func style(){
        configureGradient()

    }
    
    private func layout(){
        
    }
    
    private func AuthStatus(){
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let controller = UINavigationController(rootViewController: LoginVC())
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true)
                
                
            }
        }else {
            self.view.backgroundColor = .white
            
        }
    }
    
    private func signOut(){
        try? Auth.auth().signOut()
        AuthStatus()
    }
}
