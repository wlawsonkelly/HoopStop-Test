//
//  Photo.swift
//  HoopStop Test
//
//  Created by William Kelly on 1/6/19.
//  Copyright © 2019 William Kelly. All rights reserved.
//

import Foundation

class Photo {
    let img_src: URL
    let photoID: String
    let earth_date: String
    
    init(img_src: URL, photoID: String, earth_date: String) {
        self.img_src = img_src
        self.photoID = photoID
        self.earth_date = earth_date
    }
    
}
