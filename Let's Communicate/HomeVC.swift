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
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        AuthStatus()
    }
    
}


//MARK: Helpers

extension HomeVC {
    
    private func style(){
        
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
            self.view.backgroundColor = .green
            
        }
    }
    
    private func signOut(){
        try? Auth.auth().signOut()
    }
}
