//
//  MarsTableController.swift
//  HoopStop Test
//
//  Created by William Kelly on 1/5/19.
//  Copyright © 2019 William Kelly. All rights reserved.
//

import UIKit

class MarsTableController: UITableViewController, UIGestureRecognizerDelegate {
    
    var photoStore: PhotoStore!
    
    var photosToDisplay: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(MarsTableController.handleLongPress(_:)))
        lpgr.minimumPressDuration = 1
        tableView.addGestureRecognizer(lpgr)

        view.backgroundColor = .gray
        
        navigationItem.title = "Mars Rover Photos"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        photoStore = PhotoStore()
        tableView.dataSource = self
        photoStore.fetchNASAPhotos { (photosResult) in
            switch photosResult {
            case let .success(photos):
                self.photosToDisplay = photos
                print("these are the photos to display: \(self.photosToDisplay)")
            case let .failure(error):
                print("Error fetching nasa photos: \(error)")
            }
            self.tableView.reloadData()
        }
        
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.photosToDisplay.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  MarsCell()
        print("uploading photo man!!!!!!!")
        let photo = photosToDisplay[indexPath.row]

        let data = try? Data(contentsOf: photo.img_src)
        if let imageData = data {
            let image = UIImage(data: imageData)
            cell.updateImageView(with: image)
        }
        let dateData = photo.earth_date
        let photoData = photo.photoID
        cell.date.text = dateData + " Photo ID: " + photoData
        return cell
    }
    
    
    @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer){
        if gesture.state != .began { return }
        let tapLocation = gesture.location(in: self.tableView)
        if let tapIndexPath = self.tableView.indexPathForRow(at: tapLocation) {
            if let tappedCell = self.tableView.cellForRow(at: tapIndexPath) as? MarsCell {
                let detailController = DetailsViewController()
                detailController.picOfTheDay = tappedCell.imageView!
                let navController = UINavigationController(rootViewController: detailController)
                present(navController, animated: true)
            }
        }
    }

}
