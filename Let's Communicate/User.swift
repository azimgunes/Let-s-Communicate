//
//  User.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 18.05.2024.
//

import Foundation

struct User{
    let uid: String
    let name: String
    let username: String
    let email: String
    let profileImage: String
    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.username = data["username"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.profileImage = data["profileImage"] as? String ?? ""
    }
}


struct lastUser{
    let user: User
    let message: Message
}
