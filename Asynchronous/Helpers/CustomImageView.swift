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

    guard let imageData = try? Data(contentsOf: url) else { return }
    let retreivedImage = UIImage(data:imageData)
    
    self.image = retreivedImage
  }

}
