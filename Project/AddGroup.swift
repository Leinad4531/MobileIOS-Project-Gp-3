//
//  AddGroup.swift
//  Project
//
//  Created by Anand Biehl on 2024-04-17.
//

import SwiftUI

struct AddGroup: View {
    @State var name: String = ""
    @State var icon: String = ""
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            TextField("Name", text: $name).padding().keyboardType(.alphabet)
            TextField("Icon", text: $icon).padding()
            Button("Save") {
                let product = ProductGroup(name: name, icon: icon, items: nil)
                modelContext.insert(product)
            }.padding()
        }
        .modelContainer(for: ProductGroup.self)
    }
}
