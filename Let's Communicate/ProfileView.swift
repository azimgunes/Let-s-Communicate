//
//  ProfileView.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 15.06.2024.
//

import UIKit
import FirebaseAuth

class ProfileView: UIView {
    
    //MARK: Proporties
    //MARK: Lifecycle
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


//MARK: Helpers

extension ProfileView{
    private func style(){
        backgroundColor =  #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    }
    private func layout(){
        
    }
    private func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Service.fetchUser(uid: uid) { user in
            print(user.username)
        }
    }
}
