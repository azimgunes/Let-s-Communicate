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
    private let viewControllers: [UIViewController] = [ChatsVC(), MessageVC()]
    
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    //signOut()
        AuthStatus()
        navBarColor()
        
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
        chatsButton = UIBarButtonItem(customView: configureBar(text: "Chats", selector: #selector(chatButton)))
        messageScreen = UIBarButtonItem(customView: configureBar(text: "Message", selector: #selector(messageButton)))
        
        self.navigationItem.leftBarButtonItems = [chatsButton]
        
        self.navigationItem.rightBarButtonItems = [messageScreen]
        
        
        
        //Container
        
        configureContainer()
        chatButton()
    }
    
    private func layout(){
        
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
    
    @objc private func chatButton(){
        if self.container.children.first == ChatsVC() {return}
        self.messageScreen.customView?.alpha = 0.5
        self.chatsButton.customView?.alpha = 1
        self.container.add(viewControllers[0])
        viewControllers[1].remove()
    }
    
    @objc private func messageButton(){
        if self.container.children.first == ChatsVC() {return}
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

