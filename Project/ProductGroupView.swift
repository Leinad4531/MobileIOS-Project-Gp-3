//
//  ProductGroupView.swift
//  Project
//
//  Created by Olamitide Akomolafe on 2024-02-12.
//

import Foundation
import SwiftUI


struct ProductGroupView: View {
    let group: ProductGroup
    
    var body: some View {
        HStack {
            Image(systemName: group.icon)
                .foregroundColor(.blue)
                .imageScale(.large)
                .font(.system(size: 20, weight: .bold)) // Specify size and make it bold
            Text(group.name)
                .fontWeight(.medium)
            Spacer()
            Text("3 Items") // Example text
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .modelContainer(for: ProductGroup.self)
    }
}
