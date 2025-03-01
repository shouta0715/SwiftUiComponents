//
//  PictureView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/03/01.
//

import SwiftUI

struct PictureView: View {
  @Environment(NavigationData.self) var app
  
    var body: some View {
      if app.selectedBook == nil {
        VStack {
          Text("No book selected")
          Button("Back") {
            app.viewPath.removeLast()
          }
          
        }
      } else {
        VStack {
          Image(app.selectedBook!.cover)
            .resizable()
            .scaledToFit()
          Spacer()
        }
        .navigationTitle(Text("Cover"))
        .navigationBarBackButtonHidden()
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button("Back") {
              app.viewPath.removeLast()
            }
          } //: ToolbarItem
          ToolbarItem(placement: .navigationBarTrailing) {
            Button("Back to List") {
              app.viewPath = NavigationPath()
            }
          }
        } //: Toolbar
      }
    }
}

#Preview {
  NavigationStack {
    PictureView()
      .environment(NavigationData.shared)
  }
}
