//
//  Interactor.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import Foundation

protocol InteractorInput: Sendable {
  func fetchData() async
}
final class Interactor: InteractorInput {
  let worker: Worker
  let presenter: InteractorOutput

  init(worker: Worker, presenter: InteractorOutput) {
    self.worker = worker
    self.presenter = presenter

    print("init \(self)")
  }

  func fetchData() async {
    print("interactor fetchData")
    print("isMainThread: \(Thread.current.isMainThread)\n")

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

struct Post {
  let id: String
  let title: String
  let post: String
}
