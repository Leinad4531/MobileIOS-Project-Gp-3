import SwiftUI

struct HomeView: View {
    @State private var showShoppingList = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Product Groups Section
//                    ForEach(ProductGroup.sampleData, id: \.name) { group in
//                        NavigationLink(destination: GroupDetailView(group: group)) {
//                            ProductGroupView(group: group)
//                        }
//                    }
                    
                    // Quick Access Buttons
                    QuickAccessButtons(
                        onAddNewItem: {
                            
                        },
                        onShowShoppingList: {
                            showShoppingList = true
                        }
                    )
                    
                    // Summary Section
                    SummaryView()
                }
                .padding()
            }
            
            .navigationTitle("Shopping List App")
            .background(
                NavigationLink( destination: ShoppingListView(), isActive: $showShoppingList) { EmptyView() }
            )
        }
        .modelContainer(for: ProductGroup.self)
        .modelContainer(for: Item.self)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
