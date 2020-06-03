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
    image = nil
    addSpinner()
    guard let imageData = try? Data(contentsOf: url) else { return }
    let retreivedImage = UIImage(data:imageData)
    
    DispatchQueue.main.async {
      self.image = retreivedImage
      self.activityIndicator.stopAnimating()
    }
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
}
