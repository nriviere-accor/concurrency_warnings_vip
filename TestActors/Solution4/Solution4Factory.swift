//
//  Factory.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import Foundation

struct Solution4Factory {
  @MainActor func makeView() -> Solution4View {
    let worker = Worker()
    let presenter = Solution4Presenter()
    let interactor = Solution4Interactor(worker: worker, presenter: presenter)
    let view = Solution4View(interactor: interactor, presenter: presenter)

    return view
  }
}
