//
//  Presenter.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import Foundation

protocol Solution3InteractorOutput {
  func format(posts: [Solution3Interactor.Post]) async
}

@MainActor
final class Solution3Presenter: Solution3InteractorOutput, ObservableObject {
  @Published private(set) var posts: [PostLightViewData] = []

  init() {
    print("init \(self)")
  }

  func format(posts: [Solution3Interactor.Post]) async {
    print("Solution3Presenter format")
    print("isMainThread: \(Thread.current.isMainThread)\n")

    let presentationReadyPosts = await heavyProcess(posts: posts)
    self.posts = presentationReadyPosts.map {
      PostLightViewData(id: $0.id, title: String($0.title[0...10]))
    }
//    self.posts = posts.map {
//      PostLightViewData(id: $0.id, title: String($0.title[0...10]))
//    }
  }

  nonisolated func heavyProcess(posts: [Solution3Interactor.Post]) async -> [PostLightViewData] {
    print("Solution3Presenter heavy work")
    print("isMainThread: \(Thread.current.isMainThread)\n")
    let postsLightViewData = posts.map {
      PostLightViewData(id: $0.id, title: String($0.title[0...10]))
    }
    let reorderedposts = postsLightViewData.shuffled().shuffled().shuffled().shuffled().shuffled().shuffled().shuffled()

    return reorderedposts
  }

  deinit {
    print("deinit \(self)\n\n")
  }
}
extension Solution3Presenter {
  struct PostLightViewData: Identifiable, Sendable {
    let id: String
    let title: String
    // let post: String
  }
}

extension Solution3Presenter.PostLightViewData {
  static func postLightViewData() -> Solution3Presenter.PostLightViewData {
    if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
      .init(id: "", title: "")
    } else {
      fatalError("Should use this model only for previews")
    }
  }

}

//import SwiftUI
//extension PreviewProvider {
//  static func postLightViewData() -> Presenter.PostLightViewData { .init(id: "", title: "") }
//}
//
//extension PreviewRegistry {
//  static func postLightViewDataRegistery() -> Presenter.PostLightViewData { .init(id: "", title: "") }
//}
