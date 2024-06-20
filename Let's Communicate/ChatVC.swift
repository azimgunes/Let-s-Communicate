//
//  ChatVC.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 20.05.2024.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import SDWebImage


class ChatVC: UICollectionViewController {
    
    //MARK: Proporties
    
    var message : Message?
    var messages = [Message]()
    
    private let reuseId = "ChatCell"
    
    private lazy var chatInputView = ChatInputView(frame: .init(x: 0, y: 0, width: view.frame.width, height: view.frame.height*0.09))
    
    private let user: User
    
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    //MARK: Lifecycle
    
    init(user: User) {
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .white
        collectionView.backgroundColor = .white
        print("Clicked \(user.name).")
        style()
        layout()
        fetchMessages()
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override var inputAccessoryView: UIView?{
        get{return chatInputView}
    }
    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
}

//MARK: Service



//MARK: Helpers

extension ChatVC{
    private func style(){
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: reuseId)
        chatInputView.delegate = self
        navigationItem.title = user.name
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
    }
    
    private func layout(){
        
    }
    
}

//MARK: UICV Delegate/Data Source
extension ChatVC{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! MessageCell
        cell.message = messages[indexPath.row]
        cell.message?.user = user 
        return cell
    }
}


extension ChatVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 16, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let newCell = MessageCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 90))
        newCell.message = messages[indexPath.row]
        newCell.layoutIfNeeded()
        let target = CGSize(width: view.frame.width, height: 90)
        let newCellSize = newCell.systemLayoutSizeFitting(target)
        return .init(width: view.frame.width, height: newCellSize.height)
    }
}

//MARK: ChatInputViewProtocol

extension ChatVC: ChatInputViewProtocol{
    func sendMessage(_ chatInputView: ChatInputView, message: String) {
        
        
        Service.sendMessagetoData(message: message, toUser: user) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
        }
        chatInputView.clearTextView()
        
    }
    private func fetchMessages(){
        Service.fetchMessages(user: user) { messages in
            self.messages = messages
            self.collectionView?.reloadData()
            
            self.collectionView.scrollToItem(at: [0, messages.count - 1], at: .bottom, animated: true)
        }
    }
    
    
    
}
