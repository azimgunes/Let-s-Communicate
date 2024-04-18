//
//  AuthenticationService.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 18.04.2024.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore



struct AuthenticationServiceUser {
    var emailText: String
    var nameText: String
    var passwordText: String
    var usernameText: String
}

struct AuthenticationService {
    static func Register(withUser user: AuthenticationServiceUser, image: UIImage, completion: @escaping(Error?) -> Void){
        let photoName = UUID().uuidString
        
        guard let profileData = image.jpegData(compressionQuality: 0.5) else {return}
        
        let refarence = Storage.storage().reference(withPath: "media/profile_image/\(photoName).png")
        
        refarence.putData(profileData) { storageMeta, error in
            if let error = error {
                completion(error)
                return
            }
                refarence.downloadURL { url, error in
                    if let error = error {
                        completion(error)
                        return
                    }
                    
                    Auth.auth().createUser(withEmail: user.emailText, password: user.passwordText) { result, error in
                        if let error = error {
                            completion(error)
                            return
                        }
                            guard let userUid = result?.user.uid else {return}
                            let data = [
                            
                                "email" : user.emailText,
                                "name" : user.nameText,
                                "profileImage" : url?.absoluteString,
                                "username" : user.usernameText,
                                "uid" : userUid,
                            ] as! [String: Any]
                            Firestore.firestore().collection("User Info").document(userUid).setData(data, completion: completion)
                        print("Account Created Successfully!")
                    }
                }
            }
    }

}
