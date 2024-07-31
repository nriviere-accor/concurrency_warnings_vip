//
//  Presenter.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import Foundation

protocol Solution1InteractorOutput {
  @MainActor
  func format(posts: [Post]) async
  // async non-obligatoire si pas de tâche asynchrone
}

final class Solution1Presenter: Solution1InteractorOutput, ObservableObject {
  @Published private(set) var posts: [PostLightViewData] = []

  init() {
    print("init \(self)")
  }
  // @MainActor pas obligatoire
  func format(posts: [Post]) async {
    print("Solution1Presenter format")
    print("isMainThread: \(Thread.current.isMainThread)\n")

    let presentationReadyPosts = await heavyProcess(posts: posts)
    self.posts = presentationReadyPosts.map {
      PostLightViewData(id: $0.id, title: String($0.title[0...10]))
    }
//    self.posts = posts.map {
//      PostLightViewData(id: $0.id, title: String($0.title[0...10]))
//    }
  }

  nonisolated func heavyProcess(posts: [Post]) async -> [PostLightViewData] {
    print("Solution1Presenter heavy work")
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
extension Solution1Presenter {
  struct PostLightViewData: Identifiable, Sendable { // scoper ou non, il y a quand même un warning
    let id: String
    let title: String
    // let post: String
  }
}

extension Solution1Presenter.PostLightViewData {
//extension PostLightViewData {
  static func postLightViewData() -> Solution1Presenter.PostLightViewData {
//  static func postLightViewData() -> PostLightViewData {
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

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}
