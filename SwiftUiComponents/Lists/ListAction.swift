//
//  ListAction.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/16.
//

import SwiftUI

struct ListAction: View {
  @Environment(ApplicationData.self) var app
  @State private var selectedRows: Set<Book.ID> = []
  @State private var editModeIsActive = false

  
  func removeSelected() {
    var indexes = IndexSet()
    for item in selectedRows {
      if let index = app.userData.firstIndex(where: { $0.id == item }) {
        indexes.insert(index)
      }
    }
    
    app.userData.remove(atOffsets: indexes)
    selectedRows = []
  }
  
  // MARK: - BODY
    var body: some View {
      VStack {
        HStack {
          Button(editModeIsActive ? "Done" : "Edit") {
              editModeIsActive.toggle()
          }
          
          Spacer()
          Button {
            withAnimation {
              removeSelected()
            }
          } label: {
            Image(systemName: "trash")
          }
          .disabled(selectedRows.count == 0)
        } //: HStack
        .padding()
        
        List(selection: $selectedRows) {
          ForEach(app.userData) { book in
            BookItem(book: book)
          }
          .onDelete { indexes in
            app.userData.remove(atOffsets: indexes)
          }
          .onMove { source, destination in
            app.userData.move(fromOffsets: source, toOffset: destination)
          }
        } //: List
        .listStyle(.plain)
        .environment(
          \.editMode,
           .constant(editModeIsActive ? EditMode.active : EditMode.inactive)
        )
      }
    }
}

#Preview {
    ListAction()
    .environment(ApplicationData.shared)
}
