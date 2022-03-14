//
//  CarViewModel.swift
//  FatemeGuidomiaBellTest
//
//  Created by Fateme Feraghi on 2022-03-12.
//

import Foundation
import UIKit

struct CarViewModel {
    
    let car: Car
    
    var carImage: UIImage { return car.setCarImage()}
    var customerPrice: Double { return car.customerPrice }
    var makeAndModel: String { return car.carName}
    var price: String { return car.carPrice }
    var prosList: [String] { return car.prosList }
    var constList: [String] { return car.consList }
    var rating: String { return car.carRate }
    
    init(car: Car) {
        self.car = car
    }
}


