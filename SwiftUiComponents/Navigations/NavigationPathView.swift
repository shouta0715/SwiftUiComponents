//
//  NavigationPathView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/03/01.
//

import SwiftUI

struct NavigationPathView: View {
  @Environment(NavigationData.self) var app
  
  
    var body: some View {
      @Bindable var app = app
      
      NavigationStack(path: $app.viewPath) {
        List(app.userData) { book in
          NavigationLink(value: book) {
            BookItem(book: book)
          } //: Navigation
        } //: List
        .navigationTitle("Books")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            NavigationLink(value: "Setting View") {
              Image(systemName: "gearshape")
            }
          }
        } //: Toolbar
        .navigationDestination(for: Book.self) { book in
          DetailView(book: book, viewPath: $app.viewPath)
        } //: Navigation
        .navigationDestination(for: String.self) { viewId in
          if viewId == "Setting View" {
            SettingView()
          } else if viewId == "Picture View" {
            PictureView()
          }
        } //: Navigation
      }
    }
}

#Preview {
    NavigationPathView()
    .environment(NavigationData.shared)
}
