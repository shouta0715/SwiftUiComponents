//
//  SearchView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/23.
//

import SwiftUI

struct SearchableView:View {
  @Environment(\.isSearching) var isSearching
  @Environment(\.dismissSearch) var dismissSearch
  
  var body: some View {

    
    Button {
      if isSearching {
        dismissSearch()
      }
    } label: {
      Text(isSearching ? "Cancel" : "Search")
    }
  }
}

enum Scopes {
  case title, author
}

struct Tokens: Identifiable, Equatable {
  let id = UUID()
  let name: String
}

struct SearchView: View {
  // MARK: - Property
  @Environment(NavigationData.self) var app
  @State private var searchTerm: String = ""
  @FocusState private var isFocused: Bool
  @State private var scope:Scopes = .title
  @State private var tokens: [Tokens] = []

  
  func handleSubmit() {
    
    let search = searchTerm.trimmingCharacters(in: .whitespaces)
    app.filterValues(search: search, author:tokens.first?.name ?? "")
  }
  
  // MARK: - Body
    var body: some View {
      NavigationStack {
        List {
          SearchableView()
          Button("Focus") {
            isFocused = true
          }
          
          ForEach(app.filteredItems) { book in
            BookItem(book: book)
          }
        }
        .navigationTitle("Search")
        .toolbar {
          let list = app.userData.map {$0.author}
          let authors = Set(list).sorted()
          
          Menu {
            ForEach(authors, id: \.self) { author in
              Button {
                let token = Tokens(name: author)
                tokens = [token]
              } label: {
                Text(author)
              }
            }
          
          } label: {
            Image(systemName: "line.horizontal.3.decrease.circle")
          }
        }
      }
      .searchable(
        text: $searchTerm,
        tokens:$tokens,
        placement: .navigationBarDrawer(displayMode: .always),
        prompt: Text("Insert Title"), token: { token in
          Text(token.name)
        }
      )
      .searchScopes($scope, scopes: {
        Text("Title").tag(Scopes.title)
        Text("Author").tag(Scopes.author)
      })
      .searchFocused($isFocused)
      .onSubmit(of: .search, {
        handleSubmit()
      })
      .searchSuggestions({
        ForEach(app.filteredItems) { book in
          Text("\(book.title) - \(book.author)")
            .searchCompletion(book.title)
        }
      })
      .onChange(of: tokens, { _,_ in
        handleSubmit()
      })
      .onChange(of: searchTerm) { _, _  in
        handleSubmit()
      }
    }
}

#Preview {
    SearchView()
    .environment(NavigationData.shared)
}
