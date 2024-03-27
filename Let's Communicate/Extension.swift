//
//  Extension.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 27.03.2024.
//

import UIKit

extension UIViewController {
    func configureGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.locations = [0,1]
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.systemPurple.cgColor]
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
        
    }
}
