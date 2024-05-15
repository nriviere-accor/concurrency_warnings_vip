//
//  ContentView.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import SwiftUI

struct ContentView: View {
  let interactor: Interactor
  @StateObject var presenter: Presenter

    var body: some View {
      ContentViewBody(posts: presenter.posts)
        .task {
          await interactor.fetchData()
        }
    }
}

struct ContentViewBody: View {
  let posts: [Presenter.PostLightViewData]
  var body: some View {
    List(posts) { post in
      HStack {
        Text(post.id)
        Spacer()
        Text(post.title)
      }
    }
  }
}

#Preview {
  ContentViewBody(posts: [
    .init(id: "1", title: "Test"),
    .init(id: "2", title: "Test another title")
  ])
}
