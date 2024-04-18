//
//  Item.swift
//  Project
//
//  Created by Olamitide Akomolafe on 2024-02-12.
//

import Foundation
import SwiftData

@Model
class Item {
    @Attribute(.unique)
    var id = UUID() // Ensure this is present
    
    var name: String
    var quantity: Int
    var price: Double
    var taxRate: Double
    var imageName: String
    var count: Int
    var purchased: Bool
    
    
    init(name: String, quantity: Int, price: Double, taxRate: Double, imageName: String, count: Int = 0, purchased: Bool = false) {
        self.name = name
        self.quantity = quantity
        self.price = price
        self.taxRate = taxRate
        self.imageName = imageName
        self.count = count
        self.purchased = purchased
    }
}
