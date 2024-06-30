//
//  UserCell.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 17.05.2024.
//

import UIKit
import SDWebImage

class UserCell: UITableViewCell {
    //MARK: Proporties
    
    var user: User?{
        didSet{
            configureUser()
            
        }
    }
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Name"
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Username"
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var stackView = UIStackView()
    //MARK: Lifecycle
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        styleFunc()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UserCell{
    private func styleFunc(){
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.layer.cornerRadius = 30
        
        
        
        //stackView
        
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(usernameLabel)
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout(){
        
        addSubview(profileImage)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            //Profile Image
            profileImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 60),
            profileImage.widthAnchor.constraint(equalToConstant: 60),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            
            //Stack View
            stackView.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 6),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            
        ])
        
    }
    
    private func configureUser(){
        guard let user = user else {return}
        self.nameLabel.text = user.name
        self.usernameLabel.text = user.username
        self.profileImage.sd_setImage(with: URL(string: user.profileImage))
    }
}
