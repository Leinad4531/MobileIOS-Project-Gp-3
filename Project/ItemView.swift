//
//  ItemView.swift
//  Project
//
//  Created by Anand Biehl on 2024-04-16.
//

import Foundation
import SwiftUI
import SwiftData
import Combine
import SymbolPicker

struct ItemView: View {
    @State private var name = ""
    @State private var quantity = 0
    @State private var price: String = "0"
    @State private var taxRate = "1.13"
    @State private var imageName = ""
    @State private var iconPickerPresented = false
    @State private var category = ""
    
    @Query private var productGroups: [ProductGroup]
    
    let item: Item?
    
    private var title: String {
        item == nil ? "Add Item" : "Edit Item"
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Quantity", selection: $quantity) {
                    Text(verbatim: "Select the number of \($name)").tag(0 as Int)
                    ForEach(0..<9999) { i in
                        Text(verbatim: "\(i)").tag(i as Int)
                    }
                }
                
                TextField("Price", text: $price, onEditingChanged: {_ in 
                    let formatter = NumberFormatter()
                    formatter.numberStyle = .currency
                    let number = formatter.number(from: price)
                    if number != nil {
                        self.item?.price = number as! Double
                    }
                })
                .keyboardType(.numberPad)
                
                TextField("Tax Rate", text: $taxRate, onEditingChanged: {_ in
                    let formatter = NumberFormatter()
                    formatter.numberStyle = .percent
                    let number = formatter.number(from: taxRate)
                    if number != nil {
                        self.item?.taxRate = number as! Double
                    }
                })
                .keyboardType(.numberPad)
                
                
                Button {
                    iconPickerPresented = true
                }
                label: {
                    HStack {
                        Image(systemName: imageName)
                        Text(imageName)
                    }
                }
                .sheet(isPresented: $iconPickerPresented) {
                    SymbolPicker(symbol: $imageName)
                }
                
                Picker("Category", selection: $category, content: {
                    ForEach(productGroups) { productGroup in
                        VStack {
                            Label(productGroup.name, systemImage: productGroup.icon)
                        }
                    }
                })
            }
        }
    }
}


//                    .keyboardType(.numberPad)
//                    .onReceive(Just(price_)) { currentValue in
//                        let filteredValue = currentValue.filter { "0123456789".contains($0) }
//                        if filteredValue != currentValue {
//                            self.price_ = filteredValue
//                        }
//                    }
