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
    
    private var container = Container()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        //signOut()
        AuthStatus()
        
    }
    
}


//MARK: Helpers

extension HomeVC {
    
    private func configureBar(text: String, selector: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.setTitleColor(UIColor.purple, for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }
    
    private func style(){
        configureGradient()
        chatsButton = UIBarButtonItem(customView: configureBar(text: "Chats", selector: #selector(chatButton)))
        messageScreen = UIBarButtonItem(customView: configureBar(text: "Message", selector: #selector(messageButton)))
        
        
        //self.navigationItem.leftBarButtonItems = [chatsButton, messageScreen]
        
        self.navigationItem.leftBarButtonItems = [chatsButton]
        
        self.navigationItem.rightBarButtonItems = [messageScreen]
        
        //Container
        
        configureContainer()

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
        
    }
    
    @objc private func messageButton(){
        
    }
}


class Container: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradient()
    }
}
