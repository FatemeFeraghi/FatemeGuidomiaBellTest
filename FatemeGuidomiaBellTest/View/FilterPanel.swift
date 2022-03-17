//
//  FilterPanel.swift
//  FatemeGuidomiaBellTest
//
//  Created by Fateme Feraghi on 2022-03-15.
//

import Foundation
import UIKit

class FilterPanel : UIView {
    
    private let filterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Filters"
        label.textColor = .white
        return label
    }()
    
    private let makeTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "Any make")
        tf.textColor = .lightGray
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let modelTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "Any model")
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = .lightGray
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        
        self.addSubviews(filterLabel, makeTextField, modelTextField)
        
        self.backgroundColor = UIColor(named: Constants.darkGray)
        
        applyConstraints()
    }
    
    private func applyConstraints(){
        
        filterLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20)
        
        makeTextField.anchor(top: filterLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20)
        
        modelTextField.anchor(top: makeTextField.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20)
        
    }
}
