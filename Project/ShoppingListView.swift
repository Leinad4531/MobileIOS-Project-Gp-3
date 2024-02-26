import Foundation
import SwiftUI

struct ShoppingListView: View {
    @State private var shoppingItems: [ShoppingItem] = [
        // Sample items
        ShoppingItem(name: "Apples", price: 1.99, taxRate: 0.07, quantity: 10, isPurchased: false),
        ShoppingItem(name: "Bread", price: 2.49, taxRate: 0.07, quantity: 2, isPurchased: false),
        ShoppingItem(name: "Sponge", price: 2.49, taxRate: 0.07, quantity: 2, isPurchased: false),
        ShoppingItem(name: "Pods", price: 2.49, taxRate: 0.07, quantity: 2, isPurchased: false),

        // Add more items as needed
    ]

    var body: some View {
        VStack {
            List {
                ForEach($shoppingItems) { $item in
                    HStack {
                        Button(action: {
                            item.isPurchased.toggle()
                        }) {
                            Image(systemName: item.isPurchased ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(item.isPurchased ? .green : .gray)
                                .imageScale(.large)
                        }

                        VStack(alignment: .leading) {
                            Text(item.name).font(.headline)
                            Text("Quantity: \(item.quantity)").font(.subheadline)
                        }
                        Spacer()
                        Text(String(format: "$%.2f", item.price * Double(item.quantity)))
                            .bold()
                    }
                    .padding(.vertical, 8)
                }
            }

            Divider()

            summarySection(items: shoppingItems)
                .padding()
        }
        .navigationTitle("Shopping List")
    }

    private func summarySection(items: [ShoppingItem]) -> some View {
        let subtotal = items.reduce(0) { $0 + $1.price * Double($1.quantity) }
        let totalTax = items.reduce(0) { $0 + $1.price * $1.taxRate * Double($1.quantity) }
        let total = subtotal + totalTax

        return VStack(alignment: .leading) {
            Text("Summary").font(.title2).bold()
            HStack {
                Text("Subtotal:")
                Spacer()
                Text(String(format: "$%.2f", subtotal))
            }
            HStack {
                Text("Total Tax:")
                Spacer()
                Text(String(format: "$%.2f", totalTax))
            }
            HStack {
                Text("Total Cost:")
                Spacer()
                Text(String(format: "$%.2f", total)).bold()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}
