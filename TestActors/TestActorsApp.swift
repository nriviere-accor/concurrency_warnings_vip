//
//  TestActorsApp.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import SwiftUI

@main
struct TestActorsApp: App {
    var body: some Scene {
        WindowGroup {
          MainView()
        }
    }
}

struct MainView: View {
  var body: some View {
    NavigationStack {
      VStack {
        NavigationLink("Go to list", value: UUID())
      }
      .navigationDestination(for: UUID.self) { _ in
        Factory().makeView()
      }
    }
  }
}
