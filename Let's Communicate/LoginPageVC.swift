//
//  LoginPageVC.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 25.06.2024.
//

import UIKit

class LoginPageVC: UIViewController {
    
    //MARK: Properties
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "login")
        imageView.tintColor = .purple
        return imageView
    }()
    
    private let infoLabel: UILabel = {
       let label = UILabel()
        
        label.text = "Communication is essential for connecting people, fostering relationships, resolving conflicts, enhancing productivity, promoting learning, and driving social change. It underpins personal development, professional success, and societal cohesion."
        label.contentMode = .scaleToFill
        return label
        
        
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.007843137255, green: 0.003921568627, blue: 0.4901960784, alpha: 1)
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Register!", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.007843137255, green: 0.003921568627, blue: 0.4901960784, alpha: 1)
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5512737036, green: 0.7472981811, blue: 0.8018106222, alpha: 1)
        
        style()
        layout()
    }
}
//MARK: Selector





//MARK: Helpers
extension LoginPageVC{
    private func style(){
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        view.addSubview(loginButton)
        view.addSubview(iconImageView)
        view.addSubview(infoLabel)
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
        
            
            iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            iconImageView.heightAnchor.constraint(equalToConstant: 225),
            iconImageView.widthAnchor.constraint(equalToConstant: 225),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            infoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8),
            
            
            loginButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            registerButton.widthAnchor.constraint(equalToConstant: 100),
            
        ])

    }
}
