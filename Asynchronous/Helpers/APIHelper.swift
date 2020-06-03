//
//  DogAPIHelper.swift
//  Asynchronous
//
//  Created by Grace Njoroge.
//  Copyright © 2020 Grace. All rights reserved.
//

import Foundation

final class PicsumApi {
  
  static let shared = PicsumApi()
  
  func fetchRandomImages(completion: @escaping ([RandomImages]) -> ()) {
    let urlString = "https://picsum.photos/v2/list"
    let url = URL(string: urlString)!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let data = data else {
        print("data was nil")
        return
      }

      guard let dogImagesList = try? JSONDecoder().decode([RandomImages].self, from: data) else {
        print("couldnt decode")
        return
      }
      completion(dogImagesList)
    }
    task.resume()
  }
}

struct PhotoArray: Codable {
  let photoArray: [RandomImages]
}

struct RandomImages: Codable {
  let id: String
  let author: String
  let width: Int
  let height: Int
  let url: String
  let download_url: String
}



