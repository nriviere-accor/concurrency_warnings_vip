//
//  Factory.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import Foundation

struct Solution3Factory {
  @MainActor func makeView() -> Solution3View {
    let worker = Worker()
    let presenter = Solution3Presenter()
    let interactor = Solution3Interactor(worker: worker, presenter: presenter)
    let view = Solution3View(interactor: interactor, presenter: presenter)

    return view
  }
}
