//
//  Factory.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import Foundation

struct Factory {
  @MainActor func makeView() -> ContentView {
    let worker = Worker()
    let presenter = Presenter()
    let interactor = Interactor(worker: worker, presenter: presenter)
    let view = ContentView(interactor: interactor, presenter: presenter)

    return view
  }
}
