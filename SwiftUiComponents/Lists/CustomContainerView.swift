//
//  CustomContainerView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/22.
//

import SwiftUI

struct CustomContainerView<Content: View>: View {
  @ViewBuilder var content: Content
    var body: some View {
      VStack {
        ForEach(subviews: content) { subview in
          HStack {
            subview
              .padding()
          }
          .frame(minWidth: 0,maxWidth: .infinity)
          .border(.red,width: 6)
          .padding(5)
        }
      }
    }
}

#Preview {
  CustomContainerView {
    Text("Hello, World!")
  }
}
