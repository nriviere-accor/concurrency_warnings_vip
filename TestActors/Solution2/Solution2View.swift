//
//  ContentView.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import SwiftUI

struct Solution2View: View {
  let interactor: Solution2Interactor
  @StateObject var presenter: Solution2Presenter

    var body: some View {
      Solution2ViewContentBody(posts: presenter.posts)
        .task {
          await interactor.fetchData()
        }
    }
}

struct Solution2ViewContentBody: View {
  let posts: [Solution2Presenter.PostLightViewData]
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
  Solution2ViewContentBody(posts: [.postLightViewData()])
}
