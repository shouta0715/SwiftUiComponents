//
//  SwiftUiComponentsApp.swift
//  SwiftUiComponents
//
//  Created by k21047kk on 2025/02/15.
//

import SwiftUI

@main
struct SwiftUiComponentsApp: App {
  @State private var app = ApplicationData.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
            .environment(app)
        }
    }
}
