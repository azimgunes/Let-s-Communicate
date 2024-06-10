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
    
    static func fetchUser(uid: String, completion: @escaping(User) -> Void ){
        Firestore.firestore().collection("User Info").document(uid).getDocument { snapshot, error in
            guard let data = snapshot?.data() else {return}
            let user = User(data: data)
            completion(user)
        }
        
    }
    
    static func fetchLastUser(completion: @escaping([lastUser])-> Void){
        var lastUsers = [lastUser]()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Firestore.firestore().collection("messages").document(uid).collection("last-messages").order(by: "timestamp").addSnapshotListener { snapshot, error in
            snapshot?.documentChanges.forEach({ value in
                let data = value.document.data()
                let message = Message(data: data)
                self.fetchUser(uid: message.toId) { user in
                    lastUsers.append(lastUser(user: user, message: message))
                    completion(lastUsers)
                }
                
            })
            
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
            
            Firestore.firestore().collection("messages").document(currentUid).collection("last-messages").document(toUser.uid).setData(data)
            Firestore.firestore().collection("messages").document(toUser.uid).collection("last-messages").document(currentUid).setData(data)
            
            
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
