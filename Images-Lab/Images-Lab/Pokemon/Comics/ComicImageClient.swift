//
//  ComicImageLoad.swift
//  Images-Lab
//
//  Created by Maitree Bain on 12/10/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

struct ComicImageClient {
    
    static func getComicImage(for urlString: String, completion: @escaping (Result<UIImage, AppError>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            print("no image url found \(urlString)")
            return
        }
        
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
               
                if let error = error {
                    print("error: \(error)")
                }
                
                if let data = data {
                    guard let image = UIImage(data: data) else {
                        print("no image found")
                        return
                    }
                    
                    completion(.success(image))
                    
                }
               
                
            }
            dataTask.resume()
        }
    
}
