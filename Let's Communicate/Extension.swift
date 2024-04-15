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
        gradientLayer.locations = [0,2]
        gradientLayer.colors = [UIColor.white.cgColor, UIColor( #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)).cgColor]
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
}
