//
//  SectionView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/16.
//

import SwiftUI

struct SectionView: View {
  // MARK: - PROPERTIES
  @Environment(ApplicationData.self) var app
  
  var orderList:[(key:String, value: [Book])] {
    let listGroup: [String: [Book]] = Dictionary(
      grouping: app.userData,
      by:{ value in
        let index = value.title.startIndex
        let initial = value.title[index]
        
        return String(initial)
      })
    
    return listGroup.sorted(by: { $0.key < $1.key })
  }
  
  
  
  // MARK: - BODY
    var body: some View {
      List {
        Section(header: Text("Statistics")) {
          HStack {
            Text("Total Books:")
            Spacer()
            Text("\(app.userData.count)")
          }
        } //: Section
        .headerProminence(.increased)
        .listSectionSeparator(.hidden, edges: .top)
        .listSectionSeparatorTint(.blue)
        
        Section(header: Text("My Books")) {
          ForEach(app.userData) { book in
            BookItem(book: book)
          } //: ForEach
        } //: Section
        .headerProminence(.increased)
        .listSectionSeparator(.hidden, edges: .top)
        
        
        ForEach(orderList, id: \.key) { sections in
          Section(header: Text(sections.key)) {
            ForEach(sections.value) { book in
              BookItem(book: book)
            }
          } //: Section
          .headerProminence(.increased)
        }
        
      } //:List
//      .environment(\.defaultMinListRowHeight, 100)
    }
}

#Preview {
    SectionView()
    .environment(ApplicationData.shared)
}
