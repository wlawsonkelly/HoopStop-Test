//
//  PhotoStore.swift
//  HoopStop Test
//
//  Created by William Kelly on 1/6/19.
//  Copyright © 2019 William Kelly. All rights reserved.
//

import UIKit

enum PhotosResult {
    case success([Photo])
    case failure(Error)
}

enum NasaError: Error {
    case invalidJSONData
}

class PhotoStore {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    private func processPhotosRequest(data: Data?, error: Error?) -> PhotosResult {
        
        guard let jsonData = data else { return .failure(error!) }
        
        return NasaAPI.photos(fromJSON: jsonData)
    }
    
    func fetchNASAPhotos(completion: @escaping (PhotosResult) -> Void) {
        
        let url = NasaAPI.roverURL
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            let result = self.processPhotosRequest(data: data, error: error)
            
            OperationQueue.main.addOperation {
                completion(result)
            }
            
        }
        
        task.resume()
    }
    
    
}
