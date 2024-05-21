//
//  ChatInputView.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 21.05.2024.
//

import UIKit

class ChatInputView: UIView{
    
    
    //MARK: Proporties
    private let textView: UITextView = {
        
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.textColor =  #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        
        return textView
        
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send", for: .normal)
        return button
        
    }()
    //MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        
        style()
        layout()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: Helpers


extension ChatInputView {
    
    private func style(){
        textView.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func layout(){
        
        addSubview(textView)
        addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textView.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -8),
            bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10),
        
            sendButton.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            trailingAnchor.constraint(equalTo: sendButton.trailingAnchor, constant: 8),
            sendButton.heightAnchor.constraint(equalToConstant: 60),
            sendButton.widthAnchor.constraint(equalToConstant: 60),
         
            
        ])
    }
}
