//
//  ContentView.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import SwiftUI

struct Solution1View: View {
  let interactor: Solution1InteractorInput
  @StateObject var presenter: Solution1Presenter

    var body: some View {
      Solution1ViewContentBody(posts: presenter.posts)
        .task {
          await interactor.fetchData()
        }
    }
}

struct Solution1ViewContentBody: View {
  let posts: [Solution1Presenter.PostLightViewData]
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
  Solution1ViewContentBody(posts: [.postLightViewData()])
}
