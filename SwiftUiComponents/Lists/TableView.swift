//
//  TableView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/22.
//

import SwiftUI

struct TableView: View {
  @Environment(TableData.self) var app
    var body: some View {
      Table(of: ConsumableItem.self) {
        TableColumn("Name", value: \.name)
        TableColumn("Category", value: \.category)
        TableColumn("Cateogries") { item in
          Text("\(item.calories)")
        }
        .width(100)
      } rows: {
        TableRow(
          ConsumableItem(
            name: "STANDARD",
            category: "",
            calories: 0,
            included: false
          )
        )
        ForEach(app.listOfItems)
      }

    }
}

#Preview {
    TableView()
    .environment(TableData.shared)
}
