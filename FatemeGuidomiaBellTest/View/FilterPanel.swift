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
        label.translatesAutoresizingMaskIntoConstraints = false
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

        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews(filterLabel, makeTextField, modelTextField)

        self.backgroundColor = UIColor(named: Constants.darkGray)
        
        applyConstraints()
    }
    
    private func applyConstraints(){
        filterLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        filterLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
        filterLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
//        filterLabel.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        makeTextField.leadingAnchor.constraint(equalTo: self.filterLabel.leadingAnchor).isActive = true
        makeTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        makeTextField.topAnchor.constraint(equalTo: self.filterLabel.bottomAnchor, constant: 10).isActive = true
//        makeTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        modelTextField.leadingAnchor.constraint(equalTo: self.filterLabel.leadingAnchor).isActive = true
        modelTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        modelTextField.topAnchor.constraint(equalTo: self.makeTextField.bottomAnchor, constant: 10).isActive = true
//        modelTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
