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
