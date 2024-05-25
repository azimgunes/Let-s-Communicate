//
//  ChatVC.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 20.05.2024.
//

import UIKit


class ChatVC: UICollectionViewController {
    
    private lazy var chatInputView = ChatInputView(frame: .init(x: 0, y: 0, width: view.frame.width, height: view.frame.height*0.09))

    private let user: User
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
        

      
    }
    
    override var inputAccessoryView: UIView?{
        get{return chatInputView}
    }

    override var canBecomeFirstResponder: Bool{
        return true
    }

}


