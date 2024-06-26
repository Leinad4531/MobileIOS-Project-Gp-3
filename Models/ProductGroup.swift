//
//  ProductGroup.swift
//  Project
//
//  Created by Olamitide Akomolafe on 2024-02-12.
//

import Foundation
import SwiftUI
import SwiftData


// Sample data for demonstration purposes

func sample() -> [ProductGroup] {
    let sampleData: [ProductGroup] = [
        ProductGroup(name: "Food", icon: "cart", items: [
                Item(name: "Apples", quantity: 10, price: 1.99, taxRate: 0.07, imageName: "applelogo"),
                Item(name: "Bread", quantity: 2, price: 2.49, taxRate: 0.07, imageName: "leaf")
        ]),
        ProductGroup(name: "Cleaning Supplies", icon: "bubble.left.and.bubble.right", items: [
                Item(name: "Detergent", quantity: 1, price: 5.99, taxRate: 0.07, imageName: "drop.fill"),
                Item(name: "Sponge", quantity: 4, price: 0.99, taxRate: 0.07, imageName: "square.grid.2x2.fill")
        ]),
        ProductGroup(name: "Electronics", icon: "desktopcomputer", items: [
                Item(name: "Laptop", quantity: 1, price: 999.99, taxRate: 0.07, imageName: "laptopcomputer"),
                Item(name: "Earbuds", quantity: 1, price: 199.99, taxRate: 0.07, imageName: "earpods")
        ])
    ]
    
    return sampleData
}

@Model
class ProductGroup: Identifiable {
    var id: UUID
    var name: String
    var icon: String
    var items: [Item] // Ensure this line is included
    
    init(name: String, icon: String, items: [Item]?) {
        self.id = UUID()
        self.name = name
        self.icon = icon
        self.items = items!
    }
}
