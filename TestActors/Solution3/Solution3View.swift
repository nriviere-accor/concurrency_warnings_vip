//
//  ContentView.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import SwiftUI

struct Solution3View: View {
  let interactor: Solution3InteractorInput
  @StateObject var presenter: Solution3Presenter

    var body: some View {
      Solution3ViewContentBody(posts: presenter.posts)
        .task {
          await interactor.fetchData()
        }
    }
}

struct Solution3ViewContentBody: View {
  let posts: [Solution3Presenter.PostLightViewData]
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
  Solution3ViewContentBody(posts: [.postLightViewData()])
}
