//
//  DatePickerView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/22.
//

import SwiftUI

struct DatePickerView: View {
  @State private var selectedDate: Date = Date()
    var body: some View {
      VStack {
        Text(
          "Selected Date: \(selectedDate.formatted(.dateTime.day().month()))"
        )
        DatePicker(
          "Date",
          selection: $selectedDate,
          in: Date()...,
          displayedComponents: .date
        )
        .labelsHidden()
        .datePickerStyle(.wheel)
        Spacer()
      }
      .padding()
    }
}

#Preview {
    DatePickerView()
}
