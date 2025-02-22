//
//  PickerView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/22.
//

import SwiftUI

struct PickerView: View {
  @State private var selectedValue: Int = 0
  let listCities: [String] = ["Tokyo", "New York", "London", "Paris", "Berlin"]
  
    var body: some View {
      VStack {
        Text("Selected Value: \(listCities[selectedValue])")
        Picker("Cities:" , selection: $selectedValue) {
          ForEach(listCities.indices, id: \.self) { value in
            Text(listCities[value])
              .tag(value)
          }
        }
        .pickerStyle(.palette)
        Spacer()
      }
      .padding()
    }
}

#Preview {
    PickerView()
}
