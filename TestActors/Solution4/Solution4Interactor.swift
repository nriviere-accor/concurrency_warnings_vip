//
//  Interactor.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import Foundation

protocol Solution4InteractorInput {
  func fetchData() async
}

struct Solution4Interactor: Solution4InteractorInput {
//actor Solution4Interactor: Solution4InteractorInput { quand l'interactor necessite de muter des données
  let worker: Worker
  let presenter: Solution4InteractorOutput

  init(worker: Worker, presenter: Solution4InteractorOutput) {
    self.worker = worker
    self.presenter = presenter

    print("init \(self)")
  }

  func fetchData() async {
    print("Solution4Interactor fetchData")
    print("isMainThread: \(Thread.current.isMainThread)\n")

    let postsData = await worker.fetchRandomStuff()
    let posts = postsData.map {
      Post(id: String($0.id), title: $0.title, post: $0.body)
    }
    
    await presenter.format(posts: posts)
  }

//  deinit {
//    print("deinit \(self)")
//  }
}

//extension Solution4Interactor {
//  struct Post: Sendable {
//    let id: String
//    let title: String
//    let post: String
//  }
//}
