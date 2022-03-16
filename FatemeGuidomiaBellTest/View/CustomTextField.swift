//
//  CustomTextField.swift
//  FatemeGuidomiaBellTest
//
//  Created by Fateme Feraghi on 2022-03-15.
//

import UIKit


class CustomTextField: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        //To apply left padding to the TextField placeholder
        let spacer = UIView()
        
        spacer.translatesAutoresizingMaskIntoConstraints = false
        spacer.widthAnchor.constraint(equalToConstant: 10).isActive = true
        spacer.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        leftView = spacer
        leftViewMode = .always
        
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        keyboardType = .emailAddress
        backgroundColor = .white
        keyboardType = .emailAddress
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.layer.cornerRadius = 12
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes:
                                                    [.foregroundColor: UIColor.gray])
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
