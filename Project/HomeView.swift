import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var showShoppingList = false
    @State private var showAddGroup = true
    @Query private var productGroups: [ProductGroup]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Product Groups Section
                    ForEach(productGroups) { group in
                        NavigationLink(destination: GroupDetailView(group: group)) {
                            ProductGroupView(group: group)
                        }
                    }
                    
                    // Quick Access Buttons
                    QuickAccessButtons(
                        onAddNewItem: {
                            showShoppingList = false
                            showAddGroup = true
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
                    NavigationLink( destination: ShoppingListView(), isActive: $showShoppingList) {
                        EmptyView()
                    }
            )
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
