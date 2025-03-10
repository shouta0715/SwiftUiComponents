
import SwiftUI
import Observation

struct MainItems: Identifiable {
   var id = UUID()
   var name: String
   var options: [MainItems]?
}

@Observable class MenuItemData: @unchecked Sendable {
   var items: [MainItems] = []

   static let shared: MenuItemData = MenuItemData()
   private init() {
      items = [
         MainItems(name: "Food", options: [
            MainItems(name: "Oatmeal", options: nil),
            MainItems(name: "Bagels", options: nil),
            MainItems(name: "Brownies", options: nil),
            MainItems(name: "Cheese", options: [
               MainItems(name: "Roquefort", options: nil),
               MainItems(name: "Mozzarella", options: nil),
               MainItems(name: "Cheddar", options: nil)
            ]),
            MainItems(name: "Cookies", options: nil),
            MainItems(name: "Donuts", options: nil)
         ]),
         MainItems(name: "Beverages", options: [
            MainItems(name: "Coffee", options: nil),
            MainItems(name: "Juice", options: nil),
            MainItems(name: "Lemonade", options: nil)
         ])
      ]
   }
}
