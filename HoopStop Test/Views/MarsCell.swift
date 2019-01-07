//
//  MarsCell.swift
//  HoopStop Test
//
//  Created by William Kelly on 1/5/19.
//  Copyright © 2019 William Kelly. All rights reserved.
//

import UIKit

class MarsCell: UITableViewCell {
    
    
    var marsController: MarsTableController?
    
    var picOfTheDay = UIImageView()
    
    var date: UILabel = {
        let label = UILabel()
        label.text = "Uploading Date"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.heightAnchor.constraint(equalToConstant: 30)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let overallStackView = UIStackView(arrangedSubviews: [imageView!, date])
        overallStackView.axis = .vertical
        overallStackView.spacing = 16
        addSubview(overallStackView)
        overallStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        overallStackView.fillSuperview()
        
    }
    
    func updateImageView(with image: UIImage?) {
        print("Doing PHOTOOTOTOTOTOTOTO")
        self.imageView!.image = image
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
