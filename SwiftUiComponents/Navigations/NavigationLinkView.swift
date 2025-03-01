//
//  NavigationLinkView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/23.
//

import SwiftUI

struct NavigationLinkView: View {
  @Environment(NavigationData.self) var app
    var body: some View {
      NavigationStack {
        List(app.userData) { book in
          NavigationLink {
            CellBook(book: book)
          } label: {
            BookItem(book: book)
          }

        }
        .navigationTitle("Books")
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            NavigationLink(destination: SettingView()) {
              Image(systemName: "gearshape")
            }
          }
        }
      }
    }
}

#Preview {
    NavigationLinkView()
    .environment(NavigationData.shared)
}
