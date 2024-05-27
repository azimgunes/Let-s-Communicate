//
//  MessageCell.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 27.05.2024.
//

import UIKit

class MessageCell: UICollectionViewCell{
    
    //MARK: Proporties
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private let messageContainer: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .red
        
        return containerView
    }()
    
    private let messageText: UITextView = {
       let textView = UITextView()
        textView.text = "Message"
        textView.textColor = .white
        textView.backgroundColor = .clear
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    }()
    //MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension MessageCell{
    private func style(){
        
        backgroundColor = .brown
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.layer.cornerRadius = 30
        
        messageContainer.translatesAutoresizingMaskIntoConstraints = false
        messageContainer.layer.cornerRadius = 15
        messageContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        messageText.translatesAutoresizingMaskIntoConstraints = false
    
        
    }
    
    private func layout(){
        addSubview(profileImage)
        addSubview(messageContainer)
        addSubview(messageText)
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 60),
            profileImage.heightAnchor.constraint(equalToConstant: 60),
            bottomAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: -8),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            
            
            
            messageContainer.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            messageContainer.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8),
            messageContainer.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            
            messageText.topAnchor.constraint(equalTo: messageContainer.topAnchor),
            messageText.leadingAnchor.constraint(equalTo: messageContainer.leadingAnchor),
            messageText.trailingAnchor.constraint(equalTo: messageContainer.trailingAnchor),
            messageText.bottomAnchor.constraint(equalTo: messageContainer.bottomAnchor),
            
        ])
        
    }
    
    
    
}
