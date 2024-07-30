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
        NavigationLink("Go to solution 1", value: 1)
        NavigationLink("Go to solution 2", value: 2)
        NavigationLink("Go to solution 3", value: 3)
        NavigationLink("Go to solution 4", value: 4)
      }
      .navigationDestination(for: Int.self) { value in
        if value == 1 {
          Solution1Factory().makeView()
        } else if value == 2 {
          Solution2Factory().makeView()
        } else if value == 3 {
          Solution3Factory().makeView()
        } else if value == 4 {
          Solution4Factory().makeView()
        } else {
          fatalError("screen does not exist")
        }
      }
    }
  }
}
