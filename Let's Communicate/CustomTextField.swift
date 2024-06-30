//
//  EmailTextField.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 28.03.2024.
//

import UIKit

class CustomTextField: UITextField, UITextFieldDelegate {
    init(placeholder: String) {
        super.init(frame: .zero)
        attributedPlaceholder = NSMutableAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(  #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))])
        borderStyle = .none
        textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        tintColor =  #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        font = .boldSystemFont(ofSize: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
