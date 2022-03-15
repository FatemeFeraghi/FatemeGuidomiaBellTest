//
//  UIView_addSubviews.swift
//  FatemeGuidomiaBellTest
//
//  Created by Fateme Feraghi on 2022-03-12.
//

import Foundation
import UIKit


extension UIView {
    
    func addSubviews ( _ subviews : UIView... ) {
        
        for subview in subviews {
            self.addSubview(subview)
        }
        
    }
    
}

extension NSAttributedString {
 
    func addBullets() -> NSAttributedString {
        let attributedText = NSAttributedString(string: Constants.bullets,
                                                attributes: [.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(named: Constants.customOrange) as Any])
        return attributedText
    }
    
    func displayProssAndCons(_ array: [String]) -> NSAttributedString {
        let bullet = NSAttributedString().addBullets()
        
        let attributedString = NSMutableAttributedString()
        
        array.forEach {
            attributedString.append(bullet)
            attributedString.append(NSAttributedString(string: $0))
            attributedString.append(NSAttributedString(string: "\n"))
        }

        return attributedString
    }
}
