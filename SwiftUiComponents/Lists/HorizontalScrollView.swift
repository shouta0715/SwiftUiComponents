//
//  HorizontalScrollView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/16.
//

import SwiftUI

struct HorizontalScrollView: View {
  @Environment(ApplicationData.self) var app
  @State private var position = ScrollPosition(idType: Book.ID.self)
  @State private var pageNumber = 1
  
    var body: some View {
      VStack {
        Text("Page \(pageNumber)")
            .font(.title)
            .padding(.top, 10)
        
        ScrollView(.horizontal,showsIndicators: false) {
          LazyHStack(spacing: 0) {
            ForEach(app.userData) { book in
              CellBook(book: book)
                .scrollTransition(axis:.horizontal) { effect, phase in
                  effect
                    .opacity(phase.isIdentity ? 1 : 0)
                    .scaleEffect(phase.isIdentity ? 1 : 0.5)
                }
                .onScrollVisibilityChange({ visible in
                  if visible {
                    print("Book \(book.title) is visible")
                  } else {
                    print("Book \(book.title) is not visible")
                  }
                })
                .containerRelativeFrame(
                  .horizontal,
                  count: 2,
                  span: 1,
                  spacing: 0
                )
            }
            Button("< Back") {
              withAnimation(.linear(duration: 1)) {
                position.scrollTo(edge: .top)
              }
            }
            .padding([.leading, .trailing],50)
          }
          .scrollTargetLayout()
        }
        .scrollPosition($position)
        .scrollTargetBehavior(.viewAligned)
        .onScrollGeometryChange(for: Int.self, of: { geometry in
          let ave = geometry.contentOffset.x / geometry.contentSize.width
          let pages = Int(ave.rounded()) + 1
          return pages
        }, action: { _, newValue in
          pageNumber = newValue
        })
        .onChange(of: position, initial: true) {
          if let selected = position.viewID as? UUID {
            if let book = app.userData.first(where: { $0.id == selected }) {
              print("Selected book: \(book.title)")
            }
          }
        } //: ScrollView
        
        HStack {
          ForEach(app.userData) { book in
            Button {
              withAnimation(.linear(duration: 1)) {
                position.scrollTo(id: book.id)
              }
              
            } label: {
              let isSelected = (position.viewID != nil) ? book.id == position.viewID as? UUID : book.id == app.userData.first?.id
              Image(systemName: isSelected ? "circle.fill" : "circle")
                .imageScale(.small)
                .foregroundColor(isSelected ? .yellow : .gray)
              
            }
          }
        } //: HStack
        .padding(20)
      }
      
    
    }
}

struct CellBook: View {
  let book: Book
  var body: some View {
    VStack {
      Image(book.cover)
        .resizable()
        .scaledToFit()
      Text(book.title)
        .font(.caption)
    }
    .padding(10)
  }
}

#Preview {
    HorizontalScrollView()
    .environment(ApplicationData.shared)
}
