//
//  Interactor.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import Foundation

protocol Solution3InteractorInput {
  func fetchData() async
}
final class Solution3Interactor: Solution3InteractorInput {
  let worker: Worker
  let presenter: Solution3InteractorOutput

  init(worker: Worker, presenter: Solution3InteractorOutput) {
    self.worker = worker
    self.presenter = presenter

    print("init \(self)")
  }

  func fetchData() async {
//    print("Solution3Interactor fetchData")
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

extension Solution3Interactor {
  struct Post: Sendable {
    let id: String
    let title: String
    let post: String
  }
}
