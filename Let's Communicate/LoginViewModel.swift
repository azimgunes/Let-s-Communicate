//
//  LoginViewModel.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 31.03.2024.
//

import Foundation


struct LoginViewModel {
    var emailTF: String?
    var passwordTF: String?
    var status: Bool {
        return emailTF?.isEmpty == false && passwordTF?.isEmpty == false
    }
    
}
