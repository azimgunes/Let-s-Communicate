//
//  IndexViewModel.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 13.06.2024.
//

import UIKit

struct IndexViewModel{
    private let lastUser: lastUser
    init(lastUser: lastUser) {
        self.lastUser = lastUser
    }
    
    var profileImage: URL?{
        return URL(string: lastUser.user.profileImage)
    }
    var timestampString: String {
        let date = lastUser.message.timestamp.dateValue()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }
}
