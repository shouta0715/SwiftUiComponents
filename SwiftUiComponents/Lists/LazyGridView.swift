//
//  LazyGridView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/16.
//

import SwiftUI

struct LazyGridView: View {
  @Environment(ApplicationData.self) var app
  
  let guides = [
    GridItem(.flexible(minimum: 75),alignment: .top),
    GridItem(.flexible(minimum: 75),alignment: .top),
    GridItem(.flexible(minimum: 75),alignment: .top)
  ]
  
  let guide2 = [
    GridItem(.adaptive(minimum: 75),alignment: .top),
  ]
  
    var body: some View {
      ScrollView(showsIndicators: false) {
        VStack(spacing: 40) {
          LazyVGrid(columns: guides) {
            ForEach(app.userData) { book in
              Image(book.cover)
                .resizable()
                .scaledToFit()
            }
          }
          
          Divider()
          
          LazyVGrid(columns: guide2) {
            ForEach(app.userData) { book in
              Image(book.cover)
                .resizable()
                .scaledToFit()
            }
          }
        }
      }
      .padding()
    }
}

#Preview {
    LazyGridView()
    .environment(ApplicationData.shared)
}
