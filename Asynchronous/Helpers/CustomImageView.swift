//
//  CustomImageView.swift
//  Asynchronous
//
//  Created by Grace Njoroge.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
  
  func loadImage(from url: URL) {
    
    image = nil
    
    if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
      self.image = imageFromCache
      return
    }
    
    guard let imageData = try? Data(contentsOf: url) else { return }
    guard let retreivedImage = UIImage(data:imageData) else {return}
    
    imageCache.setObject(retreivedImage, forKey: url.absoluteString as AnyObject)
    
    DispatchQueue.main.async {
      self.image = retreivedImage
    }
  }

}
