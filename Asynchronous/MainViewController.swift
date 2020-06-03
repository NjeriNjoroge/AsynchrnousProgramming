//
//  ViewController.swift
//  Asynchronous
//
//  Created by Grace Njoroge.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  let tableView = UITableView()
  var photoImageUrls = [String]()
  var authorNames = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupMainController()
    setupView()
    
    let anonFunc = { (fetchedDogImages: [RandomImages]) in
      for all in fetchedDogImages {
        self.photoImageUrls.append(all.download_url)
        self.authorNames.append(all.author)
      }
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
    PicsumApi.shared.fetchRandomImages(completion: anonFunc)
    tableView.dataSource = self
  }
  
  func setupMainController() {
    navigationItem.title = "Photo gallery"
    view.backgroundColor = .white
    tableView.register(GalleryTableViewCell.self, forCellReuseIdentifier: "cellId")
    tableView.rowHeight = 100
  }
  
  func setupView() {
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return photoImageUrls.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! GalleryTableViewCell

    if let imageUrls = URL(string: photoImageUrls[indexPath.row]) {
      cell.photoImageView.loadImage(from: imageUrls)
    }

    cell.authorTextLabel.text = authorNames[indexPath.row]

    return cell
  }

  
}
