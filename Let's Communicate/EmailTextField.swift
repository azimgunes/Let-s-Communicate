//
//  EmailTextField.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 28.03.2024.
//

import UIKit

class EmailTextField: UITextField {
    init(placeholder: String) {
        super.init(frame: .zero)
        attributedPlaceholder = NSMutableAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor.white])
        borderStyle = .none
        textColor = .white
        tintColor = .white
        font = .boldSystemFont(ofSize: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
