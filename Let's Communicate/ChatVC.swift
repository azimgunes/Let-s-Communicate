//
//  ChatVC.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 20.05.2024.
//

import UIKit


class ChatVC: UICollectionViewController {

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
        print("Clicked \(user.name).")
        collectionView.backgroundColor =  #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)

      
    }


}
