//
//  Presenter.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import Foundation

protocol InteractorOutput: Sendable, AnyObject {
  func format(posts: [Post]) async
}

@MainActor
final class Presenter: InteractorOutput, ObservableObject {
  @Published private(set) var posts: [PostLightViewData] = []

  init() {
    print("init \(self)")
  }

  func format(posts: [Post]) {
    print("presenter format")
    print("isMainThread: \(Thread.current.isMainThread)")

    self.posts = posts.map {
      PostLightViewData(id: $0.id, title: String($0.title[0...10]))
    }
  }

  deinit {
    print("deinit \(self)")
  }
}
extension Presenter {
  struct PostLightViewData: Identifiable, Sendable {
    let id: String
    let title: String
    // let post: String
  }
}


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
