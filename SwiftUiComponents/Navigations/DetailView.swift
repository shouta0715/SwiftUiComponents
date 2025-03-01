//
//  DetailView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/23.
//

import SwiftUI

struct DetailView: View {
  let book: Book
  @Binding var viewPath: NavigationPath
  @Environment(NavigationData.self) var app
  
    var body: some View {
      VStack {
        Text(book.title)
          .font(.title)
        
        Text(book.author)
          
        Button {
          app.selectedBook = book
          viewPath.append("Picture View")          
        } label: {
          Image(book.cover)
            .resizable()
            .scaledToFit()
            .frame(width: 100)
        }
        Spacer()
      }
      .padding()
      .navigationTitle("Book")
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden(true)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Go back") {
            viewPath.removeLast()
          }
        }
      }
    }
}

#Preview {
  @Previewable @State var navigation = NavigationPath()
  var app = NavigationData.shared
  NavigationStack {
    DetailView(book: app.userData[0], viewPath: $navigation)
  }
}
