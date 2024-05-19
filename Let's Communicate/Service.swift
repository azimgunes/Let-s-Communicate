//
//  Service.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 18.05.2024.
//

import Foundation
import Firebase
import FirebaseFirestore


struct Service {
    static func fetchData(completion: @escaping([User]) -> Void){
        var users = [User]()
        Firestore.firestore().collection("User Info").getDocuments { snapshot, error in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }else{
                users = snapshot?.documents.map({User(data: $0.data())}) ?? []
                
                completion(users)
            }
        }
    }
}
