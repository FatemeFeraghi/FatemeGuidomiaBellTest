//
//  Car.swift
//  FatemeGuidomiaBellTest
//
//  Created by Fateme Feraghi on 2022-03-12.
//

import Foundation
import UIKit

struct Car: Codable {
    let consList: [String]
    let customerPrice: Double
    let make: String
    let marketPrice: Double
    let model: String
    let prosList: [String]
    var rating: Int
    
    var carName: String {
        return make + " " + model
    }
    
    var carPrice: String {
        let price = Int(customerPrice / 1000)
        return "Price: " + String(price) + Constants.grand
    }
    
    var carRate: String {
        
        var stars = "★"
        let rate = " " + stars
        for _ in 1..<rating {
            stars.append(rate)
        }
        return stars
    }
    
    func prosIsHidden() -> Bool {
        return prosList.count == 0
    }
    
    func consIsHidden() -> Bool {
        return consList.count == 0 
    }
    
    func setCarImage() -> UIImage {
        
        switch make {
        case "Alpine" :
            return #imageLiteral(resourceName: "Alpine_roadster")
        case "Land Rover" :
            return #imageLiteral(resourceName: "Range_Rover")
        case "BMW" :
            return #imageLiteral(resourceName: "BMW_330i")
        case "Mercedes Benz" :
            return #imageLiteral(resourceName: "Mercedez_benz_GLC")
        default:
            return UIImage()
        }
    }
}
