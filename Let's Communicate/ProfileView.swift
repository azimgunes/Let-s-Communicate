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
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.font = UIFont(name: "footnote", size: 48)
        label.textColor = .white
        label.text = "Azim Güneş"
        label.textAlignment = .center
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "malatyalii"
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textAlignment = .center
        return label
    }()
    
    private let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let signoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Out", for: .normal)
        button.titleLabel?.font = UIFont(name: "footnote", size: 8)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.red.cgColor
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor =  #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 0.3096261161)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
        
        stackView = UIStackView(arrangedSubviews: [nameLabel, usernameLabel, spaceView, signoutButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        stackView.spacing = 3
    }
    private func layout(){
        addSubview(profileImageView)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            profileImageView.widthAnchor.constraint(equalToConstant: 120),
            profileImageView.heightAnchor.constraint(equalToConstant: 120),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            stackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 24),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 20),
            
        ])
        
    }
    private func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Service.fetchUser(uid: uid) { user in
            print(user.username)
        }
    }
}
