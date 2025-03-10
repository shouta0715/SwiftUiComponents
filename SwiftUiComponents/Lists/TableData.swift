
import SwiftUI
import Observation

struct ConsumableItem: Identifiable {
   let id = UUID()
   var name: String
   var category: String
   var calories: Int
   var included: Bool
}
@Observable class TableData: @unchecked Sendable {
   var listOfItems: [ConsumableItem] = []
   
   static let shared: TableData = TableData()
   private init() {
      listOfItems = [
         ConsumableItem(name: "Bagels", category: "Baked", calories: 250, included: false),
         ConsumableItem(name: "Brownies", category: "Baked", calories: 466, included: false),
         ConsumableItem(name: "Butter", category: "Dairy", calories: 717, included: false),
         ConsumableItem(name: "Cheese", category: "Dairy", calories: 402, included: false),
         ConsumableItem(name: "Juice", category: "Beverages", calories: 23, included: false),
         ConsumableItem(name: "Lemonade", category: "Beverages", calories: 40, included: false)
      ]
   }
}
