//
//  ShoppingItem.swift
//  Project
//
//  Created by Olamitide Akomolafe on 2024-02-12.
//
import SwiftUI

import Foundation

struct ShoppingItem: Identifiable {
    let id = UUID()
    var name: String
    var price: Double
    var taxRate: Double
    var quantity: Int
    var isPurchased: Bool
}
