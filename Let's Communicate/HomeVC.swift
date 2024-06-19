//
//  HomeVC.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 24.04.2024.
//

import UIKit
import FirebaseAuth


class HomeVC: UIViewController {
    
    //MARK: Properties
    
    private var chatsButton: UIBarButtonItem!
    private var messageScreen: UIBarButtonItem!
    private var container = ContainerVC()
    
    private let profileView = ProfileView()
    private var isProfileViewActive : Bool = false
    
    
    
    
    //MARK: viewControllers 
    private let indexVC = IndexVC()
    private let messageVC = MessageVC()
    
    private lazy var viewControllers: [UIViewController] = [indexVC, messageVC]
    
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        //signOut()
        AuthStatus()
        navBarColor()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chatButton()
    }
    
    
}


//MARK: Helpers

extension HomeVC {
    
    
    private func configureBar(text: String, selector: Selector) -> UIButton {
        
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }
    
    private func style(){
        configureGradient()
        
        self.navigationController?.navigationBar.tintColor = .white
        chatsButton = UIBarButtonItem(customView: configureBar(text: "Index", selector: #selector(chatButton)))
        messageScreen = UIBarButtonItem(customView: configureBar(text: "Message", selector: #selector(messageButton)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: UIBarButtonItem.Style.done, target: self, action: #selector(profileButton))
        self.navigationItem.leftBarButtonItems = [chatsButton, messageScreen]
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.layer.cornerRadius = 25
        profileView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        self.messageVC.delegate = self
        self.indexVC.delegate = self
        
        
        
        //Container
        
        configureContainer()
        chatButton()
    }
    
    private func layout(){
        view.addSubview(profileView)
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            profileView.widthAnchor.constraint(equalToConstant: view.frame.width*0.6),
            
        ])
    }
    
    private func configureContainer(){
        guard let containerView = container.view else {return}
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
    }
    
    private func AuthStatus(){
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let controller = UINavigationController(rootViewController: LoginVC())
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true)
                
                
            }
        }else {
            self.view.backgroundColor = .white
            
        }
    }
    
    private func signOut(){
        try? Auth.auth().signOut()
        AuthStatus()
    }
}


//MARK: Selectors


extension HomeVC{
    
    
    @objc private func profileButton(_ sender: UIBarButtonItem){
        UIView.animate(withDuration: 0.3) {
            if self.isProfileViewActive{
                self.profileView.frame.origin.x = self.view.frame.width
            }else{
                self.profileView.frame.origin.x = self.view.frame.width*0.4
                
            }
            
        }
        self.isProfileViewActive.toggle()
    }
    
    @objc private func chatButton(){
        if self.container.children.first == IndexVC() {return}
        self.messageScreen.customView?.alpha = 0.5
        self.chatsButton.customView?.alpha = 1
        self.container.add(viewControllers[0])
        viewControllers[1].remove()
    }
    
    @objc private func messageButton(){
        if self.container.children.first == IndexVC() {return}
        self.messageScreen.customView?.alpha = 1
        self.chatsButton.customView?.alpha = 0.5
        self.container.add(viewControllers[1])
        viewControllers[0].remove()
    }
    
    @objc private func navBarColor(){
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
}
//MARK: messageVCProtocol
extension HomeVC: messageVCProtocol{
    func toChatVC(user: User) {
        let controller = ChatVC(user: user)
        self.navigationController?.pushViewController(controller, animated: true)
        
        
        
        
        
    }
    
    
}

//MARK: IndexVcProtocol
extension HomeVC: IndexVcProtocol {
    func showMessageVc(_ indexVC: IndexVC, user: User) {
        let controller = ChatVC(user: user)
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
}
