
import Foundation
import UIKit


struct RegisterViewModel {
    
    var name: String?
    var username: String?
    var email: String?
    var password: String?
    
    var status: Bool {
        return name?.isEmpty == false && username?.isEmpty == false && email?.isEmpty == false && password?.isEmpty == false 
    }
    
}


