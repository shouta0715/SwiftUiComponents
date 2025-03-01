//
//  SettingView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/23.
//

import SwiftUI

struct SettingView: View {
  @Environment(\.dismiss) var dismiss
  @State private var showPicture = false
  @State private var showYear = false
  
  // MARK: - BODY
    var body: some View {
      Form {
        Toggle(isOn: $showPicture) {
          Text("Show Picture")
        }
        
        Toggle(isOn: $showYear) {
          Text("Show Year")
        }
      } //: Form
      .navigationTitle("Settings")
      .navigationBarBackButtonHidden()
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Go back") {
            dismiss()
          }
        }
      }
      
      
    }
}

#Preview {
  NavigationStack {
    SettingView()
  }
}
