//
//  ProfileView.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 15.06.2024.
//

import UIKit
import FirebaseAuth
import SDWebImage

protocol ProfileViewProtocol: AnyObject {
    func signOutProfileView()
}

class ProfileView: UIView {
    
    //MARK: Proporties
    
    var user: User?{
        didSet{configure()}
    }
    
    weak var delegate: ProfileViewProtocol?
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor =  #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 2
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textAlignment = .center
        return label
    }()
    
    private let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame.size.height = 10
        return view
    }()
    
    private lazy var signoutButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Sign Out", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.red.cgColor
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor =  #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 0.07131696431)
        button.addTarget(self, action: #selector(signOut), for: .touchUpInside)
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
//MARK: Selector

extension ProfileView{
    @objc private func signOut(_ sender: UIButton){
        delegate?.signOutProfileView()
    }
}

//MARK: Helpers

extension ProfileView{
    
    private func configure(){
        guard let user = self.user else { return }
        self.usernameLabel.attributedText = attributedText(headerTitle: "", title: "\(user.username)")
        self.nameLabel.attributedText = attributedText(headerTitle: "", title: "\(user.name)")
        self.profileImageView.sd_setImage(with: URL(string: user.profileImage))
    }
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
    
    private func attributedText(headerTitle: String, title: String) -> NSMutableAttributedString{
        let attributed = NSMutableAttributedString(string: "\(headerTitle)", attributes: [.foregroundColor: UIColor.white.withAlphaComponent(0.7), .font: UIFont.systemFont(ofSize: 14, weight: .bold)])
        attributed.append(NSAttributedString(string: title, attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16, weight: .heavy)]))
        return attributed
    }
}
