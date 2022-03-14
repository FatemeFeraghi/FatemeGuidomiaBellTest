//
//  CarHeader.swift
//  FatemeGuidomiaBellTest
//
//  Created by Fateme Feraghi on 2022-03-13.
//

import Foundation
import UIKit

class CarHeader: UIView {
    
    private let tacomaImageView: UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Tacoma")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let tacomaLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tacoma 2021"
        return label
    }()
    
    private let getYoursLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Get your's now"
        return label
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
        self.addSubviews(tacomaImageView,tacomaLabel, getYoursLabel)

        applyConstraints()
    }

    private func applyConstraints(){
        
        tacomaImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tacomaImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tacomaImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        tacomaImageView.heightAnchor.constraint(equalTo: self.tacomaImageView.widthAnchor, multiplier: 0.7).isActive = true
        
        tacomaLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        tacomaLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tacomaLabel.bottomAnchor.constraint(equalTo: self.getYoursLabel.topAnchor, constant: -10).isActive = true
        tacomaLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        getYoursLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        getYoursLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        getYoursLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        getYoursLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }

}
