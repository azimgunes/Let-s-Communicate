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
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var emailContainer: AuthenticationView = {
        let containerView = AuthenticationView(image: UIImage(systemName: "mail")!, textField: emailTextField)
        return containerView
    }()
    
    
    private let emailTextField = EmailTextField(placeholder: "Email")
  
    
    
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
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        emailContainer.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func Layout(){
        view.addSubview(iconImageView)
        view.addSubview(emailContainer)
        
        
        NSLayoutConstraint.activate([
            
            //MARK: iconImageView
            iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 150),
            iconImageView.widthAnchor.constraint(equalToConstant: 150),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //MARK: emailContainer
            emailContainer.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 30),
            emailContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailContainer.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

