//
//  IndexCell.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 13.06.2024.
//

import UIKit

class IndexCell: UITableViewCell{
    //MARK: Proporties
    var lastUser: lastUser?{
        didSet{configureIndexCell()}
    }
    
    private let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.contentMode = .scaleAspectFill
        profileImage.clipsToBounds = true
        profileImage.backgroundColor = .lightGray
        return profileImage
        
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
        
    }()
    
    private let lastMessageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        return label
        
    }()
    
    private var stackView = UIStackView()
    
    private let timesLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.text = "5:5"
        
        return label
    }()
    //MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: Helpers

extension IndexCell{
    private func setup(){
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.layer.cornerRadius = 30
        stackView = UIStackView(arrangedSubviews: [usernameLabel, lastMessageLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        
        timesLabel.translatesAutoresizingMaskIntoConstraints = false
        

    }
    
    private func layout(){
        addSubview(profileImage)
        addSubview(stackView)
        addSubview(timesLabel)
        NSLayoutConstraint.activate([
            
            //profileImage
            profileImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            profileImage.heightAnchor.constraint(equalToConstant: 60),
            profileImage.widthAnchor.constraint(equalToConstant: 60),
        
            
            //stackView
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 12),
            
            
            timesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            trailingAnchor.constraint(equalTo: timesLabel.trailingAnchor, constant: 8),
            
        
        ])
    }
    
    private func configureIndexCell(){
        
        guard let lastUser = self.lastUser else { return}
        self.usernameLabel.text = lastUser.user.username
        self.lastMessageLabel.text = lastUser.message.text

        
        
    }
}
