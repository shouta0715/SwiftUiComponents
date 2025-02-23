//
//  NavigationStackView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/23.
//

import SwiftUI

struct NavigationStackView: View {
  @State private var showNavigationBar = true
  @Environment(ApplicationData.self) var app
    var body: some View {
      NavigationStack {
        ScrollViewReader { proxy in
          List(app.userData) { book in
            BookItem(book: book)
          }
          .listStyle(.plain)
          .navigationTitle("Books")
          .navigationBarTitleDisplayMode(.inline)
          .toolbar(showNavigationBar ? .visible : .hidden, for:.navigationBar)
          .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
              Button {
                print("Add Element")
              } label: {
                Image(systemName: "plus")
              }
              
              Button {
                print("Edit Element")
              } label: {
                Image(systemName: "pencil")
              }
              
              Menu {
                Button("Operater 1") {print("operater 1")}
                Button("Operater 2") {print("operater 2")}
                Button("Operater 3") {print("operater 3")}
              } label: {
                Image(systemName: "ellipsis.circle")
              }
            }
            ToolbarItem(placement: .topBarTrailing) {
              Button {
                if let lastindex = app.userData.last?.id {
                  withAnimation {
                    proxy.scrollTo(lastindex, anchor: .bottom)
                  }
                }
              } label: {
                Image(systemName: "arrow.down")
              }
            }
            
            ToolbarItem(placement: .bottomBar) {
              HStack {
                Button {
                  showNavigationBar.toggle()
                } label: {
                  Text("Toggle NavigationBar")
                }
              } //: HStack
              .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
              
            }
          } //: toolbar
          .toolbarRole(.editor)
        }
      }
    }
}

#Preview {
    NavigationStackView()
    .environment(ApplicationData.shared)
}
