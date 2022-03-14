//
//  Provider.swift
//  FatemeGuidomiaBellTest
//
//  Created by Fateme Feraghi on 2022-03-12.
//

import Foundation


class Provider {
    
    static func loadCars() -> [Car] {
        
        var cars : [Car] = []
        
        do{
            let path = Bundle.main.path(forResource: "car_list", ofType: "json")
            let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            
            let jsonCars = Data(fileContent.utf8)
            do{
                cars = try JSONDecoder().decode([Car].self, from: jsonCars)
            } catch {
                print(error.localizedDescription)
            }
        }catch{
            print("Error reading JSON file!")
        }
        return cars
    }
    
}
