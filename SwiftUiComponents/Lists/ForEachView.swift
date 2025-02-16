//
//  ForEachView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/15.
//

import SwiftUI

struct ForEachView: View {
  @Environment(ApplicationData.self) private var app
  
    var body: some View {
        ScrollView {
          LazyVStack {
            ForEach(app.userData) { book in
              VStack {
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
                  }
                  .padding(.top, 5)
                  
                  Spacer()
                }
                
                Divider()
              }
            }
          }
          .padding(.horizontal, 10)
        }
        .scrollIndicatorsFlash(onAppear: true)
        
      
      Spacer()
    }
}

#Preview {
    ForEachView()
    .environment(ApplicationData.shared)
}
