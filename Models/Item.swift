//
//  Item.swift
//  Project
//
//  Created by Olamitide Akomolafe on 2024-02-12.
//

import Foundation

struct Item: Identifiable {
    var id = UUID() // Ensure this is present
    var name: String
    var quantity: Int
    var price: Double
    var taxRate: Double
    var imageName: String
}
