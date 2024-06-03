//
//  Message.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 1.06.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

struct Message{
    let text: String
    let toId: String
    let fromId: String
    let timestamp: Timestamp!
    let currentUser: Bool
    
    init(data: [String: Any]) {
        self.text = data["text"] as? String ?? ""
        self.toId = data["toId"] as? String ?? ""
        self.fromId = data["fromId"] as? String ?? ""
        self.timestamp = data["timestap"] as? Timestamp ?? Timestamp(date: Date())
        self.currentUser = fromId == Auth.auth().currentUser?.uid
    }
}
