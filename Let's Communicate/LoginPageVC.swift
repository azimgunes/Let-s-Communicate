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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Communication is essential for connecting people, fostering relationships, resolving conflicts, enhancing productivity, promoting learning, and driving social change. It underpins personal development, professional success, and societal cohesion."
        label.textColor = .white
        label.contentMode = .scaleAspectFit
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
        
        
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle( "Log In ", for: .normal)
        button.setTitleColor(UIColor( #colorLiteral(red: 0.007843137255, green: 0.003921568627, blue: 0.4901960784, alpha: 1)), for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7394712334)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(toLoginFormVC), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Register!", for: .normal)
        button.setTitleColor(UIColor( #colorLiteral(red: 0.007843137255, green: 0.003921568627, blue: 0.4901960784, alpha: 1)), for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7394712334)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(toRegisterFormVC), for: .touchUpInside)
        return button
    }()
    

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        
        style()
        layout()
    }
}
//MARK: Selector

extension LoginPageVC{
    
    @objc private func toLoginFormVC(){
        let controller = LoginFormVC()
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
        present(controller, animated: true, completion: nil)
    }
    @objc private func toRegisterFormVC(){
        let controller = RegisterFormVC()
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
        present(controller, animated: true, completion: nil)
    }
    
}



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
            
            infoLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 24),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            
            
            loginButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: registerButton.trailingAnchor, constant: 150),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            
            registerButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            registerButton.widthAnchor.constraint(equalToConstant: 100),
            
        ])

    }
}
