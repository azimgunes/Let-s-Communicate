//
//  RegisterVC.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 6.04.2024.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class RegisterVC: UIViewController {
    //MARK: Proporties
    
    private var profileImageUpload: UIImage?
    private var viewModel = RegisterViewModel()
    
    private let camButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.setImage(UIImage(systemName: "camera.circle.fill"), for: .normal)
        button.addTarget(nil, action: #selector(addPhoto), for: .touchUpInside)
        return button
    }()
    
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.setTitle("Back", for: UIControl.State.normal)
        button.addTarget(nil, action: #selector(toLoginVC), for: .touchUpInside)
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
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        return button
    }()

    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
    }
}
//MARK: Selectors

extension RegisterVC {
    @objc private func textFieldChanged(_ sender: UITextField){
        if sender == emailTextField {
            viewModel.email = sender.text
        } else if sender == nameTextField {
            viewModel.name = sender.text
        } else if sender == usernameTextField {
            viewModel.username = sender.text
        } else {
            viewModel.password = sender.text
        }
        registerButtonStatus()
    }
    
    @objc private func toLoginVC(_ sender: UIButton){
        let vc = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }

    @objc private func addPhoto(_ sender: UIButton){
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc private func createAccount(_ sender: UIButton){
        guard let emailText = emailTextField.text else {return}
        guard let nameText = nameTextField.text else {return}
        guard let usernameText = usernameTextField.text else {return}
        guard let passwordText = passwordTextField.text else {return}
        guard let profileImage = profileImageUpload else {return}
        
        let photoName = UUID().uuidString
        
        guard let profileData = profileImage.jpegData(compressionQuality: 0.5) else {return}
        
        let refarence = Storage.storage().reference(withPath: "media/profile_image/\(photoName).png")
        
        refarence.putData(profileData) { storageMeta, error in
            if let error = error {
                print("HATA BURADA: \(error.localizedDescription)")
            }
                refarence.downloadURL { url, error in
                    if let error = error {
                        print("HATA BURADA: \(error.localizedDescription)")
                    }
                    
                    Auth.auth().createUser(withEmail: emailText, password: passwordText) { result, error in
                        if let error = error {
                            print(error.localizedDescription)
                        }
                            guard let userUid = result?.user.uid else {return}
                            let data = [
                            
                                "email" : emailText,
                                "name" : nameText,
                                "profileImage" : url?.absoluteString,
                                "username" : usernameText,
                                "uid" : userUid,
                            ] as! [String: Any]
                            Firestore.firestore().collection("User Info").document(userUid).setData(data) { error in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                                    print("Successful!")
                            }
                        self.dismiss(animated: true)
                            
                    }
                }
            }
        }

        
    }

//MARK: Helpers


extension RegisterVC {
    private func registerButtonStatus(){
        if viewModel.status{
            registerButton.isEnabled = true
            registerButton.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            camButton.tintColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)

            
        }else {
            registerButton.isEnabled = false
            registerButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
            camButton.tintColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        }
        
    
    }
    
    
    
    private func style(){
        configureGradient()
        
        
        //backButton
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.textColor =  #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        
        
        //camButton
        
        camButton.translatesAutoresizingMaskIntoConstraints = false
        
        //registerButton
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView
        
        stackView = UIStackView(arrangedSubviews: [nameContainer, usernameContainer, emailContainer, passwordContainer, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        emailTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
    }
    
    private func layout(){
        view.addSubview(camButton)
        view.addSubview(stackView)
        view.addSubview(registerButton)
        view.addSubview(backButton)
        
        
        NSLayoutConstraint.activate([
            camButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            camButton.heightAnchor.constraint(equalToConstant: 150),
            camButton.widthAnchor.constraint(equalToConstant: 150),
            camButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            stackView.topAnchor.constraint(equalTo: camButton.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailContainer.heightAnchor.constraint(equalToConstant: 30),
            
            
            registerButton.topAnchor.constraint(equalTo: passwordContainer.bottomAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            registerButton.widthAnchor.constraint(equalToConstant: 100),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            backButton.widthAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}

extension RegisterVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        self.profileImageUpload = image
        camButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        camButton.layer.cornerRadius = 150/2
        camButton.clipsToBounds = true
        camButton.layer.borderColor = UIColor( #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)).cgColor
        camButton.layer.borderWidth = 3
        camButton.contentMode = .scaleAspectFill
        dismiss(animated: true)
    }
}
