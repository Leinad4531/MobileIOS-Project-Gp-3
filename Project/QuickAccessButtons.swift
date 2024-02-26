//
//  QuickAccessButtons.swift
//  Project
//
//  Created by Olamitide Akomolafe on 2024-02-12.
//

import Foundation
import SwiftUI


struct QuickAccessButtons: View {
    var onAddNewItem: () -> Void
    var onShowShoppingList: () -> Void

    var body: some View {
        HStack(spacing: 10) {
            Button(action: onAddNewItem) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add New Item")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }

            Button(action: onShowShoppingList) {
                HStack {
                    Image(systemName: "list.bullet.rectangle")
                    Text("Shopping List")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
    }
}
