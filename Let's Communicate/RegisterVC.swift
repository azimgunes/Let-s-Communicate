//
//  RegisterVC.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 6.04.2024.
//

import UIKit

class RegisterVC: UIViewController {
    //MARK: Proporties
    private let camButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.setImage(UIImage(systemName: "camera.circle.fill"), for: .normal)
        return button
    }()

    private lazy var emailContainer: AuthenticationView = {
        let containerView = AuthenticationView(image: UIImage(systemName: "envelope")!, textField: emailTextField)
        return containerView
    }()
    
    private lazy var nameContainer: AuthenticationView = {
        let containerView = AuthenticationView(image: UIImage(systemName: "person")!, textField: nameTextField)
        return containerView
    }()
    
    private lazy var usernameContainer: AuthenticationView = {
        let containerView = AuthenticationView(image: UIImage(systemName: "person.crop.circle.badge")!, textField: usernameTextField)
        return containerView
    }()
    
    private lazy var passwordContainer: AuthenticationView = {
        let containerView = AuthenticationView(image: UIImage(systemName: "lock.rectangle")!, textField: passwordTextField)
        return containerView
    }()
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    private let nameTextField = CustomTextField(placeholder: "Name")
    private let usernameTextField = CustomTextField(placeholder: "Username")
    private let passwordTextField : CustomTextField = {
        let textField =  CustomTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()

    
    private var stackView = UIStackView()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
  
    

    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
    }
}


//MARK: Helpers


extension RegisterVC {
    private func style(){
        configureGradient()
       // self.navigationController?.navigationBar.isHidden = true
        
        
        emailTextField.textColor =  #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        //camButton
        
        camButton.translatesAutoresizingMaskIntoConstraints = false
        
        //registerButton
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView
        
        stackView = UIStackView(arrangedSubviews: [nameContainer, usernameContainer, emailContainer, passwordContainer, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func layout(){
        view.addSubview(camButton)
        view.addSubview(stackView)
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            camButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            camButton.heightAnchor.constraint(equalToConstant: 150),
            camButton.widthAnchor.constraint(equalToConstant: 150),
            camButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            stackView.topAnchor.constraint(equalTo: camButton.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailContainer.heightAnchor.constraint(equalToConstant: 30),
        
            
            registerButton.topAnchor.constraint(equalTo: passwordContainer.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),

            registerButton.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}

