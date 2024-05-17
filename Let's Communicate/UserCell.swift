//
//  UserCell.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 17.05.2024.
//

import UIKit

class UserCell: UITableViewCell {
    //MARK: Proporties
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let title: UILabel = {
        let label = UILabel()
     
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Title"
        label.textColor =  #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
 
        return label
    }()
    
    private let subtTitle: UILabel = {
        let label = UILabel()
      
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Sub Title"
        label.textColor = .black
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
        
        
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtTitle)
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
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 4),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
                                    
        ])
        
    }
}
