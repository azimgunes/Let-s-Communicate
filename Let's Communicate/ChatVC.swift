//
//  ChatVC.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 20.05.2024.
//

import UIKit


class ChatVC: UICollectionViewController {
    
    //MARK: Proporties
    
    
    
    private let reuseId = "ChatCell"
    
    private lazy var chatInputView = ChatInputView(frame: .init(x: 0, y: 0, width: view.frame.width, height: view.frame.height*0.09))
    
    private let user: User
    
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
        
        
        
    }
    
    override var inputAccessoryView: UIView?{
        get{return chatInputView}
    }
    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
}

//MARK: Helpers

extension ChatVC{
    private func style(){
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: reuseId)
        chatInputView.delegate = self
        
        
    }
    
    private func layout(){
        
    }
    
}

//MARK: UICV Delegate/Data Source
extension ChatVC{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! MessageCell
        return cell
    }
}


extension ChatVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 16, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 90)
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
    
    
}
