//
//  CustomImageView.swift
//  Asynchronous
//
//  Created by Grace Njoroge.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {
  
  let activityIndicator = UIActivityIndicatorView(style: .medium)
  
  func loadImage(from url: URL) {
    addSpinner()
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let data = data, let newImage = UIImage(data: data) else {
        return
      }
      DispatchQueue.main.async {
        self.image = newImage
        self.activityIndicator.stopAnimating()
      }
    }
    task.resume()
//    guard let imageData = try? Data(contentsOf: url) else { return }
//    let retreivedImage = UIImage(data:imageData)
    

  }
  
  func addSpinner() {
    addSubview(activityIndicator)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
      activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
    activityIndicator.startAnimating()
  }
  
  func removeSpinner() {
    activityIndicator.stopAnimating()
    activityIndicator.removeFromSuperview()
  }
  
}
