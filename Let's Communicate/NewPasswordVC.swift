//
//  NewPasswordVC.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 10.07.2024.
//

import UIKit
import Firebase
import FirebaseAuth

class NewPasswordVC: UIViewController {
    
    //MARK: Proporties
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.setTitle("Back", for: UIControl.State.normal)
        button.addTarget(nil, action: #selector(toLoginVC), for: .touchUpInside)
        return button
    }()
    
    private let emailText: UITextField = {
       let emailField = UITextField()
        emailField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor( #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))])
        emailField.textColor = UIColor( #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
        emailField.tintColor = UIColor( #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
        return emailField
    }()
    
    private let bottomLine: UIView = {
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor( #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
        return bottomLine
    }()
    
    private lazy var newPassword: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Send", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.007843137255, green: 0.003921568627, blue: 0.4901960784, alpha: 1)
        button.layer.cornerRadius = 10
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(resetPassword), for: .touchUpInside)
        return button
    }()
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        

    }
    


}

//MARK: Selector

extension NewPasswordVC{
    
    
    @objc private func toLoginVC(_ sender: UIButton){
        let vc = LoginFormVC()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func resetPassword(_ sender: UIButton){

        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: emailText.text!) { error in
            if let error = error {
                let alert = UIAlertController(title: "Error!", message: "\(error.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Try Again!", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }else{
                let alert = UIAlertController(title: "Successful!", message: "We send an email to reset your password!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
//MARK: Helpers
extension NewPasswordVC{
    
    
    private func style(){
        
        configureGradient()

        backButton.translatesAutoresizingMaskIntoConstraints = false
        emailText.translatesAutoresizingMaskIntoConstraints = false
        newPassword.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private func layout(){
        view.addSubview(backButton)
        view.addSubview(emailText)
        view.addSubview(bottomLine)
        view.addSubview(newPassword)
        
        NSLayoutConstraint.activate([
        
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            backButton.widthAnchor.constraint(equalToConstant: 50),
            
            
            emailText.heightAnchor.constraint(equalToConstant: 45),
            emailText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 256),
            emailText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            emailText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -48),
            
            
            bottomLine.topAnchor.constraint(equalTo: emailText.bottomAnchor),
            bottomLine.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            bottomLine.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -48),
            bottomLine.heightAnchor.constraint(equalToConstant: 1),
            
            newPassword.topAnchor.constraint(equalTo: bottomLine.bottomAnchor, constant: 16),
            newPassword.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            newPassword.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -48),
            newPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newPassword.widthAnchor.constraint(equalToConstant: 130),
            newPassword.heightAnchor.constraint(equalToConstant: 50),

    
        ])
        
    }
}
