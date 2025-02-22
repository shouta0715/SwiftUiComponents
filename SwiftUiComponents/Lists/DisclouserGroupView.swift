//
//  DisclouserGroupView.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/22.
//

import SwiftUI

struct DisclouserGroupView: View {
    var body: some View {
      Form {
        DisclosureGroup("content") {
          Text("content")
        }
        DisclosureGroup("content") {
          Text("content")
        }
      }

    }
  
}

#Preview {
    DisclouserGroupView()
}
