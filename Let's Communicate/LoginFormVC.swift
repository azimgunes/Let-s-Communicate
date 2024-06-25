//
//  ViewController.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 25.03.2024.
//

import UIKit
import JGProgressHUD

class LoginFormVC: UIViewController {
    
    
    //MARK: Properties
    
    private var viewModel = LoginViewModel()
    
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "2")
        imageView.tintColor = .purple
        return imageView
    }()
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    private lazy var emailContainer: AuthenticationView = {
        let containerView = AuthenticationView(image: UIImage(systemName: "mail")!, textField: emailTextField)
        return containerView
    }()
    
    private let passwordTextField : CustomTextField = {
        let textField =  CustomTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var passwordContainer: AuthenticationView = {
        let containerView = AuthenticationView(image: UIImage(systemName: "lock.rectangle")!, textField: passwordTextField)
        return containerView
    }()
    
    
    private var stackView = UIStackView()
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 0.5510881696)
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(LogIn), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var registerPage: UIButton = {
        let button = UIButton(type: .system)
        let attributeTitle = NSMutableAttributedString(string: "Create a New Account! Register!", attributes: [.foregroundColor: UIColor(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)), .font: UIFont.boldSystemFont(ofSize: 12)])
        button.setAttributedTitle(attributeTitle, for: .normal)
        button.addTarget(self, action: #selector(toRegisterVC), for: .touchUpInside)
        return button
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        configureGradient()
        Style()
        Layout()
    }
    @objc private func toRegisterVC(_ sender: UIButton){
        let controller = RegisterFormVC()
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true, completion: nil)
    }
    
}


//MARK: Selector

extension LoginFormVC{
    
    
   @objc func LogIn(_ sender: UIButton){
        guard let emailText = emailTextField.text else {return}
        guard let passwordText = passwordTextField.text else {return}
        AuthenticationService.login(withEmail: emailText, password: passwordText) { result, error in
            if let error = error {
                let alert = UIAlertController(title: "Error!", message: "\(error.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Try Again!", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                let controller = UINavigationController(rootViewController: HomeVC())
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true)
            }
        }
        
    }
    
    
    @objc private func textFieldChanged(_ sender: UITextField){
        if sender == emailTextField {
            viewModel.emailTF = sender.text
        } else {
            viewModel.passwordTF = sender.text
        }
        loginButtonStatus()
        
    }
    
}


//MARK: Helpers
extension LoginFormVC {
    
    private func loginButtonStatus(){
        if viewModel.status{
            loginButton.isEnabled = true
            loginButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            
        }else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        }
    }
    @objc private func kbWillShow(){
        self.view.frame.origin.y = -40
        
        
    }
    @objc private func kbWillHide(){
        self.view.frame.origin.y = 0
        
    }
    
    
    private func configKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func Style(){
        configKeyboard()
        
        self.navigationController?.navigationBar.isHidden = true
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        emailContainer.translatesAutoresizingMaskIntoConstraints = false
        registerPage.translatesAutoresizingMaskIntoConstraints = false
        
        
        // StackView
        
        stackView = UIStackView(arrangedSubviews: [
            emailContainer, passwordContainer, loginButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 20
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
        view.addSubview(registerPage)
        
        
        
        
        NSLayoutConstraint.activate([
            
            //MARK: iconImageView
            iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            iconImageView.heightAnchor.constraint(equalToConstant: 150),
            iconImageView.widthAnchor.constraint(equalToConstant: 150),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //MARK: emailContainer
            stackView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 70),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailContainer.heightAnchor.constraint(equalToConstant: 45),
            
            //MARK: loginButton
            loginButton.topAnchor.constraint(equalTo: passwordContainer.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            
            //MARK: RegisterVcButton
            registerPage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5),
            registerPage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            view.trailingAnchor.constraint(equalTo: registerPage.trailingAnchor, constant: 32),
            
            
            
        ])
        
    }
}

