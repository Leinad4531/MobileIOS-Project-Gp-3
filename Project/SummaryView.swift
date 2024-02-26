//
//  SummaryView.swift
//  Project
//
//  Created by Olamitide Akomolafe on 2024-02-12.
//

import Foundation
import SwiftUI


struct SummaryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Summary")
                .font(.headline)
            Divider()
            HStack {
                Text("Total Cost:")
                Spacer()
                Text("$0.00") // Static data for demonstration
            }
            HStack {
                Text("Total Tax:")
                Spacer()
                Text("$0.00") // Static data for demonstration
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
}
