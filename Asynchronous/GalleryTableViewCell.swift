//
//  DogImageTableViewCell.swift
//  Asynchronous
//
//  Created by Grace Njoroge.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {
  
  let photoImageView: CustomImageView = {
    let imgView = CustomImageView()
    imgView.translatesAutoresizingMaskIntoConstraints = false
    imgView.backgroundColor = .lightGray
    imgView.contentMode = .scaleAspectFit
    return imgView
  }()
  
  let authorTextLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Verdana-Bold", size: 16)
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
     selectionStyle = .none
     setupView()
   }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
   
   func setupView() {
    addSubview(photoImageView)
    addSubview(authorTextLabel)
    
    NSLayoutConstraint.activate([
      photoImageView.widthAnchor.constraint(equalToConstant: 120),
      photoImageView.heightAnchor.constraint(equalToConstant: 100),
      photoImageView.topAnchor.constraint(equalTo: topAnchor)
    ])
    NSLayoutConstraint.activate([
      authorTextLabel.topAnchor.constraint(equalTo: topAnchor),
      authorTextLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 5)
    ])

   }
}
