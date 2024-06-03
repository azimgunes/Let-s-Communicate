//
//  ChatInputView.swift
//  Let's Communicate
//
//  Created by Azim Güneş on 21.05.2024.
//

import UIKit


protocol ChatInputViewProtocol: AnyObject{
    func sendMessage(_ chatInputView: ChatInputView, message: String)
    
}

class ChatInputView: UIView{
    
    weak var delegate: ChatInputViewProtocol?
    //MARK: Proporties
    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.textColor =  #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        return textView
        
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "sendbutton2"), for: .normal)
        button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        return button
        
    }()
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Text Here..."
        label.textColor =  #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        return label
        
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
        autoresizingMask = .flexibleHeight
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 15
        clipsToBounds = true
        textView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
        
        NotificationCenter.default.addObserver(self, selector: #selector(placeholderHiding), name: UITextView.textDidChangeNotification, object: nil)
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout(){
        
        addSubview(textView)
        addSubview(sendButton)
        addSubview(placeholderLabel)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            textView.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -4),
            bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20),
            
            sendButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            trailingAnchor.constraint(equalTo: sendButton.trailingAnchor, constant: 16),
            sendButton.heightAnchor.constraint(equalToConstant: 40),
            sendButton.widthAnchor.constraint(equalToConstant: 40),
            
            placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            placeholderLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 8),
            placeholderLabel.bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: -20),
            placeholderLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor),
            
            
        ])
    }
    func clearTextView(){
        textView.text = nil
        placeholderLabel.isHidden = false
    }
}


//MARK: Selector

extension ChatInputView {
    @objc private func placeholderHiding(){
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    
    @objc private func sendMessage(_ sender: UIButton){
        
        guard let message = textView.text else { return }
        self.delegate?.sendMessage(self, message: message)
        
    }
}
