//
//  DetailsViewController.swift
//  HoopStop Test
//
//  Created by William Kelly on 1/5/19.
//  Copyright © 2019 William Kelly. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var picOfTheDay = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Details"
        
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))

        view.addSubview(picOfTheDay)
        picOfTheDay.fillSuperview()
    
    }
    
    @objc fileprivate func handleBack() {
        dismiss(animated: true)
    }
}
