//
//  ProfileView.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 15.06.2024.
//

import UIKit
import FirebaseAuth

class ProfileView: UIView {
    
    //MARK: Proporties
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor =  #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.text = "Azim Güneş"
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.text = "malatyalii"
        return label
    }()
    
    private let signoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Out", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .red
        return button
        
        
    }()
    
    private lazy var stackView = UIStackView()

    //MARK: Lifecycle
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
}


//MARK: Helpers

extension ProfileView{
    private func style(){
        backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 0.3096261161)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = 60
        
        stackView = UIStackView(arrangedSubviews: [nameLabel, usernameLabel, signoutButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        stackView.spacing = 5
        
       
    }
    private func layout(){
        addSubview(profileImageView)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            profileImageView.widthAnchor.constraint(equalToConstant: 120),
            profileImageView.heightAnchor.constraint(equalToConstant: 120),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            stackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 12)
        ])
        
    }
    private func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Service.fetchUser(uid: uid) { user in
            print(user.username)
        }
    }
}
