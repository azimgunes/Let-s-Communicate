//
//  AuthenticationView.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 28.03.2024.
//

import UIKit

class AuthenticationView: UIView {
    init(image: UIImage, textField: UITextField){
        super.init(frame: .zero)
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = image
        imageView.tintColor = .purple
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        //MARK: imageView Anchors
        NSLayoutConstraint.activate([
            
            //MARK: imageView Constraints
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.widthAnchor.constraint(equalToConstant: 25),
            
            //MARK: emailTextField Constraints
            textField.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),

            
        ])
        layer.borderColor = UIColor.purple.cgColor
        layer.borderWidth = 0.2
        layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}