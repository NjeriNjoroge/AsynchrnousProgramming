//
//  DogAPIHelper.swift
//  Asynchronous
//
//  Created by Grace Njoroge.
//  Copyright © 2020 Grace. All rights reserved.
//

import Foundation

final class UnsplashApi {
  
  static let shared = UnsplashApi()
  
  func fetchRandomImages(completion: @escaping ([Image]) -> ()) {
    let accessKey = ""
    let urlString = "https://api.unsplash.com/photos/random?client_id=\(accessKey)&count=30"
    let url = URL(string: urlString)!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let data = data, let jsonString = String(data: data, encoding: .utf8) else {
        print("data was nil")
        return
      }
      
      do {
        let image = try JSONDecoder().decode([Image].self, from: data)
          completion(image)
      } catch {
        print("fetchRandomImages: \(error)")
      }
    }
    task.resume()
  }
}

struct Image: Decodable {
   let id: String
   let width: Int
   let height: Int
   let color: String
   let urls: URLs
   let user: User
}

struct URLs: Decodable {
   let raw: String
   let full: String
   let regular: String
   let small: String
   let thumb: String
}

struct User: Decodable {
    let id: String
    let updatedAt: String?
    let username, name, firstName: String?
    let lastName, twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks
    let profileImage: ProfileImage?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int?
    let acceptedTos: Bool?
}

struct UserLinks: Codable {
    let linksSelf, html, photos, likes: String?
    let portfolio, following, followers: String
}

struct ProfileImage: Codable {
    let small, medium, large: String
}

