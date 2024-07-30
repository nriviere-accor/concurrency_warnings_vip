//
//  Factory.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import Foundation

struct Solution2Factory {
  @MainActor func makeView() -> Solution2View {
    let worker = Worker()
    let presenter = Solution2Presenter()
    let interactor = Solution2Interactor(worker: worker, presenter: presenter)
    let view = Solution2View(interactor: interactor, presenter: presenter)

    return view
  }
}
