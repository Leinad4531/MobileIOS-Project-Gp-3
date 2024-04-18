import SwiftUI

struct GroupDetailView: View {
    @State var group: ProductGroup
    @State private var showingAddItemSheet = false
    
    var body: some View {
        Form {
            Section(header: Text("Items")) {
                ForEach($group.items) { $item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name).font(.headline)
                            HStack {
                                Text("Qty: \(item.quantity)")
                                Spacer()
                                Text(String(format: "$%.2f", item.price))
                            }
                            Text("TaxPrice: \(item.taxRate * 100, specifier: "%.0f")%").font(.subheadline)
                        }
                        Spacer()
                        Button(action: {
                            // Placeholder for edit action
                        }) {
                            Image(systemName: "square.and.pencil").imageScale(.large)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .onDelete(perform: deleteItems)
            }
            
            Section {
                Button(action: {
                    showingAddItemSheet = true
                }) {
                    Label("Add New Item", systemImage: "plus.circle.fill")
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            summarySection
        }
        .navigationTitle("\(group.name) Details")
        .navigationBarItems(trailing: EditButton())
        .sheet(isPresented: $showingAddItemSheet) {
            // Placeholder for AddItemView
            Text("Item Details")
        }
        .modelContainer(for: ProductGroup.self)
    }
    
    private func deleteItems(at offsets: IndexSet) {
        group.items.remove(atOffsets: offsets)
    }
    
    private var summarySection: some View {
        Section(header: Text("Summary")) {
            let subtotal = group.items.reduce(0) { $0 + $1.price * Double($1.quantity) }
            let totalTax = group.items.reduce(0) { $0 + $1.price * $1.taxRate * Double($1.quantity) }
            let total = subtotal + totalTax
            
            SummaryRow(label: "Subtotal", value: subtotal)
            SummaryRow(label: "Total Tax", value: totalTax)
            SummaryRow(label: "Total Cost", value: total, isBold: true)
        }
    }
}

struct SummaryRow: View {
    var label: String
    var value: Double
    var isBold: Bool = false
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Text(String(format: "$%.2f", value))
                .fontWeight(isBold ? .bold : .regular)
        }
    }
}
