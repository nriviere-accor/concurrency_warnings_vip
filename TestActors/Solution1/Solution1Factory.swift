//
//  Factory.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import Foundation

struct Solution1Factory {
  @MainActor func makeView() -> Solution1View { // MainActor nécessaire pour Solution1View
    let worker = Worker()
    let presenter = Solution1Presenter()
    let interactor = Solution1Interactor(worker: worker, presenter: presenter)
    let view = Solution1View(interactor: interactor, presenter: presenter)

    return view
  }
}
