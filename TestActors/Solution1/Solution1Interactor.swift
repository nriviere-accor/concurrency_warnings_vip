//
//  Interactor.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import Foundation

protocol Solution1InteractorInput {
  func fetchData() async
}
final class Solution1Interactor: Solution1InteractorInput {
  let worker: Worker
  let presenter: Solution1InteractorOutput

  init(worker: Worker, presenter: Solution1InteractorOutput) {
    self.worker = worker
    self.presenter = presenter

    print("init \(self)")
  }

  func fetchData() async {
//    print("Solution1Interactor fetchData")
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

//extension Solution1Interactor { // Produit un warning car l'interactor n'est pas Sendable, on ne peut pas scoper la donnée
//  struct Post: Sendable {
//    let id: String
//    let title: String
//    let post: String
//  }
//}
struct Post: Sendable {
  let id: String
  let title: String
  let post: String
}
