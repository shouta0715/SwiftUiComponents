//
//  MultiDayPickerView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/22.
//

import SwiftUI

struct MultiDayPickerView: View {
  @State private var selectedDates: Set<DateComponents> = []
  @State private var mydates: String = ""
    var body: some View {
      VStack {
        MultiDatePicker("Dates:",selection: $selectedDates)
        Spacer()
        Text(mydates)
      }
      .padding()
      .onChange(of: selectedDates) { old, values in
        let days = values.map { value in
          String(value.day!)
        }
        mydates = days.joined(separator: ",")
      }
    }
}

#Preview {
    MultiDayPickerView()
}
