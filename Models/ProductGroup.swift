import Foundation
import SwiftData

@Model
class ProductGroup {
    @Attribute(.unique)
    var id = UUID()
    
    @Attribute(.unique)
    var name: String
    var icon: String
    var products: [Item] // Ensure this line is included
    
    init(name: String, icon: String, products: [Item]) {
        self.name = name
        self.icon = icon
        self.products = products
    }
}
