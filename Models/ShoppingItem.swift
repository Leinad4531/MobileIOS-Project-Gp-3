//
//  ShoppingItem.swift
//  Project
//
//  Created by Olamitide Akomolafe on 2024-02-12.
//
import SwiftUI
import SwiftData
import Foundation

@Model
class ShoppingItem: Identifiable {
    @Attribute(.unique)
    let id = UUID()
    
    var name: String
    var price: Double
    var taxRate: Double
    var quantity: Int
    var isPurchased: Bool
    
    init(name: String, price: Double, taxRate: Double, quantity: Int, isPurchased: Bool) {
        self.name = name
        self.price = price
        self.taxRate = taxRate
        self.quantity = quantity
        self.isPurchased = isPurchased
    }
}
