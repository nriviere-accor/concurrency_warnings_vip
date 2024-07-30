//
//  Worker.swift
//  TestActors
//
//  Created by Nicolas RIVIERE on 07/05/2024.
//

import Foundation

final class Worker: Sendable {
  func fetchRandomStuff() async -> [PostData] {
//    print("worker format")
//    print("isMainThread: \(Thread.current.isMainThread)\n")

    do {
      let request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
      let data = try await URLSession.shared.data(for: request)
      let posts = try JSONDecoder().decode([PostData].self, from: data.0)
      
      return posts
    } catch {
      print(error)
      return []
    }
  }
}


// MARK: -

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let posts = try? JSONDecoder().decode(Posts.self, from: jsonData)

import Foundation

// MARK: - Post
struct PostData: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
