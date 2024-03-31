//
//  ViewController.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 25.03.2024.
//

import UIKit

class LoginVC: UIViewController {
    
    
    //MARK: Properties
    
    private var viewModel = LoginViewModel()
    
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "appIcon")
        imageView.tintColor = .purple
        return imageView
    }()
    
    private let emailTextField = EmailTextField(placeholder: "Email")
    private lazy var emailContainer: AuthenticationView = {
        let containerView = AuthenticationView(image: UIImage(systemName: "mail")!, textField: emailTextField)
        return containerView
    }()
    
    private let passwordTextField = PasswordTextField(placeholder: "Password")
    private lazy var passwordContainer: AuthenticationView = {
        let containerView = AuthenticationView(image: UIImage(systemName: "lock.rectangle")!, textField: passwordTextField)
        return containerView
    }()
    

    private var stackView = UIStackView()
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        button.layer.cornerRadius = 15
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
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
    
    private func loginButtonStatus(){
        if viewModel.status{
            loginButton.isEnabled = true
            loginButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            
        }else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        }
    }
    
    
    private func Style(){
        
        
        self.navigationController?.navigationBar.isHidden = true
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        emailContainer.translatesAutoresizingMaskIntoConstraints = false
        
        
        // StackView
        
        stackView = UIStackView(arrangedSubviews: [
        emailContainer, passwordContainer, loginButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Email
        emailTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
 
    private func Layout(){
        view.addSubview(iconImageView)
        view.addSubview(stackView)
        view.addSubview(loginButton)
      
        
        
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
            emailContainer.heightAnchor.constraint(equalToConstant: 30),
            
            loginButton.topAnchor.constraint(equalTo: passwordContainer.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
        ])
        
    }
}

//MARK: Selector

extension LoginVC{
    @objc private func textFieldChanged(_ sender: UITextField){
        if sender == emailTextField {
            viewModel.emailTF = sender.text
        } else {
            viewModel.passwordTF = sender.text
        }
        loginButtonStatus()

    }
}
