//
//  Service.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 18.05.2024.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

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
    
    static func sendMessagetoData(message: String, toUser: User, completion: @escaping(Error?) -> Void ){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let data = [
            "text": message,
            "fromId": currentUid,
            "toId": toUser.uid,
            "timestamp" : Timestamp(date: Date())
        ] as [String: Any]
        
        Firestore.firestore().collection("messages").document(currentUid).collection(toUser.uid).addDocument(data: data) {
            error in
            Firestore.firestore().collection("messages").document(toUser.uid).collection(currentUid).addDocument(data: data, completion: completion)
        }
        
    }
    
    static func fetchMessages(user: User, completion: @escaping([Message]) -> Void) {
        var message = [Message]()
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        Firestore.firestore().collection("messages").document(currentUid).collection(user.uid).order(by: "timestamp").addSnapshotListener { snapshot, error in
            snapshot?.documentChanges.forEach({value in
                if value.type == .added{
                    let data = value.document.data()
                    message.append(Message(data: data))
                    completion(message)
                }
                
            })
        }
    }
}
