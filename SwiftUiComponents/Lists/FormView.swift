//
//  FormView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/22.
//

import SwiftUI

struct FormView: View {
  @State private var setActive = false
  @State private var setShowPictures = false
  @State private var setTotal: Int = 10
  
  // MARK: - Body
    var body: some View {
      Form {
        Toggle("Activate", isOn: $setActive)
        Toggle("Show Pictures", isOn: $setShowPictures)
        LabeledContent("Total") {
          Text(String(setTotal))
          Stepper("",value: $setTotal, in: 0...100)
            .labelsHidden()
        }
      }
    }
}

#Preview {
    FormView()
}
