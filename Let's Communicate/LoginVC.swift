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
    }
    
    private func Layout(){
        view.addSubview(iconImageView)
        
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 150),
            iconImageView.widthAnchor.constraint(equalToConstant: 150),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

