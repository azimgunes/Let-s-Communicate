//
//  MessageViewModel.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 3.06.2024.
//

import Foundation
import UIKit

struct MessageViewModel{
    private let message: Message
    init(message: Message) {
        self.message = message
    }
    
    var messageBC: UIColor{
        return message.currentUser ? .blue.withAlphaComponent(0.7): .systemPink.withAlphaComponent(0.7)
    }
    var currentUserActive: Bool{
        return message.currentUser
    }
    
    var profileImageview: URL?{
        return URL(string: message.user?.profileImage ?? "")
    }
}

