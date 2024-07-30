//
//  Interactor.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import Foundation

protocol Solution2InteractorInput {
  func fetchData() async
}
final class Solution2Interactor: Solution2InteractorInput {
  let worker: Worker
  let presenter: Solution2InteractorOutput

  init(worker: Worker, presenter: Solution2InteractorOutput) {
    self.worker = worker
    self.presenter = presenter

    print("init \(self)")
  }

  func fetchData() async {
//    print("Solution2Interactor fetchData")
//    print("isMainThread: \(Thread.current.isMainThread)\n")

    let postsData = await worker.fetchRandomStuff()
    let posts = postsData.map {
      Post(id: String($0.id), title: $0.title, post: $0.body)
    }
    
    await presenter.format(posts: posts)
  }

  deinit {
    print("deinit \(self)")
  }
}

//extension Solution2Interactor {
//  struct Post: Sendable {
//    let id: String
//    let title: String
//    let post: String
//  }
//}
