//
//  ViewController.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 25.03.2024.
//

import UIKit

class LoginVC: UIViewController {
    
    
    //MARK: Properties
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "appIcon")
        imageView.tintColor = .purple
        return imageView
    }()
    
    private lazy var emailContainer: AuthenticationView = {
        let containerView = AuthenticationView(image: UIImage(systemName: "mail")!, textField: emailTextField)
        return containerView
    }()
    
    
    private let emailTextField = EmailTextField(placeholder: "Email")
  
    
    private lazy var passwordContainer: AuthenticationView = {
        let containerView = AuthenticationView(image: UIImage(systemName: "lock.rectangle")!, textField: passwordTextField)
        return containerView
    }()
    
    
    private let passwordTextField = PasswordTextField(placeholder: "Password")
    private var stackView = UIStackView()
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        button.layer.cornerRadius = 15
        button.isEnabled = false
        return button
    }()
  
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradient()
        Style()
        Layout()
    }
    
    
}
//MARK: Helpers
extension LoginVC {
    private func Style(){
        
        
        self.navigationController?.navigationBar.isHidden = true
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        emailContainer.translatesAutoresizingMaskIntoConstraints = false
        stackView = UIStackView(arrangedSubviews: [
        emailContainer, passwordContainer, loginButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func Layout(){
        view.addSubview(iconImageView)
        view.addSubview(stackView)
      
        
        
        NSLayoutConstraint.activate([
            
            //MARK: iconImageView
            iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 150),
            iconImageView.widthAnchor.constraint(equalToConstant: 150),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //MARK: emailContainer
            stackView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailContainer.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
}

