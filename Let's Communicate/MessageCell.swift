//
//  MessageCell.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 27.05.2024.
//

import UIKit
import SDWebImage

class MessageCell: UICollectionViewCell{
    
    var msContainerViewLeft: NSLayoutConstraint!
    var msContainerViewRight: NSLayoutConstraint!
    
    var message: Message?{
        didSet{configure()}
    }
    
    //MARK: Proporties
    
    

    
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .blue
        imageView.isUserInteractionEnabled = true
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
        textView.font = UIFont.systemFont(ofSize: 16)
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
        
        backgroundColor = .clear
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.layer.cornerRadius = 15
        profileImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        
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
            bottomAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            
            
            
            messageContainer.topAnchor.constraint(equalTo: messageText.topAnchor, constant: 48),
            messageContainer.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor),
            messageContainer.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            messageContainer.heightAnchor.constraint(lessThanOrEqualToConstant: 300),
            
            messageText.topAnchor.constraint(equalTo: messageContainer.topAnchor),
            messageText.leadingAnchor.constraint(equalTo: messageContainer.leadingAnchor),
            messageText.trailingAnchor.constraint(equalTo: messageContainer.trailingAnchor),
            messageText.bottomAnchor.constraint(equalTo: messageContainer.bottomAnchor),
            
        ])
        self.msContainerViewLeft = messageContainer.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8)
        self.msContainerViewLeft.isActive = false
        self.msContainerViewRight = messageContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        self.msContainerViewRight.isActive = false
        
    }
    private func configure(){
        guard let message = self.message else { return  }
        let viewModel = MessageViewModel(message: message)
        messageText.text = message.text
        messageContainer.backgroundColor = viewModel.messageBC
        msContainerViewRight.isActive = viewModel.currentUserActive
        msContainerViewLeft.isActive = !viewModel.currentUserActive
        profileImage.isHidden = viewModel.currentUserActive
        profileImage.sd_setImage(with: viewModel.profileImageview)
        
        
        if viewModel.currentUserActive{
            messageContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
            
        }else{
            messageContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            
        }
    }

    
}
