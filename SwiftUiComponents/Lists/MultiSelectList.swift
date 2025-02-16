//
//  MultiSelectList.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/16.
//

import SwiftUI

struct MultiSelectList: View {
  @Environment(ApplicationData.self) var app
    var body: some View {
      @Bindable var app = app
        
      List {
        ForEach($app.userData) { $book in
          HStack(alignment: .top) {
            Image(book.cover)
              .resizable()
              .scaledToFit()
              .frame(width: 80, height: 100)
            
            VStack(alignment: .leading) {
              Text(book.title)
                .bold()
              
              Text(book.author)
                
              Text(book.displayYear)
                .font(.caption)
              
              Spacer()
            } //: VStack
            Spacer()
            
            if book.selected {
              Image(systemName: "checkmark")
                .foregroundColor(.green)
                .frame(width: 25, height: 25)
            }
          } //: BookItem
          .padding(.top, 5)
          .background(.white)
          .onTapGesture {
            book.selected.toggle()
          }
          
        }
      }
    }
}

#Preview {
    MultiSelectList()
    .environment(ApplicationData.shared)
}
