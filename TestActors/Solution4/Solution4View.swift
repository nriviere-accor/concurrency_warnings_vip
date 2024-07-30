//
//  ContentView.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import SwiftUI

struct Solution4View: View {
  let interactor: Solution4Interactor
  @StateObject var presenter: Solution4Presenter

    var body: some View {
      Solution4ViewContentBody(posts: presenter.posts)
        .task {
          await interactor.fetchData()
        }
    }
}

struct Solution4ViewContentBody: View {
  let posts: [Solution4Presenter.PostLightViewData]
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
  Solution4ViewContentBody(posts: [.postLightViewData()])
}
