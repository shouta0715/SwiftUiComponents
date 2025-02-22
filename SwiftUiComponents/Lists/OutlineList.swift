//
//  OutlineList.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/22.
//

import SwiftUI

struct OutlineList: View {
  @Environment(MenuItemData.self) var app
    var body: some View {
      
      
      List(app.items , children: \.options) { item in
        Text(item.name)
      }
      
      List {
        ForEach(app.items) { item in
          Section(header: Text(item.name)) {
            OutlineGroup(item.options ?? [], children: \.options) { item in
              Text(item.name)
            }
          }
        }
      }
    }
}

#Preview {
    OutlineList()
    .environment(MenuItemData.shared)
}
