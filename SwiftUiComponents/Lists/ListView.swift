//
//  ListView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/16.
//

import SwiftUI

struct ListView: View {
  @Environment(ApplicationData.self) var app
    var body: some View {
      List(app.userData) { book in
        let index = app.userData.firstIndex(where: { $0.id == book.id }) ?? 0
        
        BookItem(book: book)
          .listRowInsets(
            EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
          )
          .listRowBackground(
            index % 2 == 0 ? Color.clear : Color.gray.opacity(0.1)
          )
          .listRowSeparator(.hidden)
      }
      .listStyle(.plain)
    }
  
}

struct BookItem: View {
  let book: Book
    
  var body: some View {
    HStack(alignment: .top) {
      Image(book.cover)
        .resizable()
        .scaledToFit()
        .frame(width: 80, height: 100)
      
      VStack(alignment: .leading, spacing: 2) {
        Text(book.title)
          .bold()
        
        Text(book.author)
        
        Text(book.displayYear)
          .font(.caption)
        
        Spacer()
      }
      .padding(.top, 5)
      
      Spacer()
    }
  }
}

#Preview {
    ListView()
    .environment(ApplicationData.shared)
}
