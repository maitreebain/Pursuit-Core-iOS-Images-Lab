//
//  ComicImageLoad.swift
//  Images-Lab
//
//  Created by Maitree Bain on 12/10/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

struct ComicAPIClient {
    
    static func getComic(for comicNum: Int, completion: @escaping (Result<ComicDataLoad, AppError>) -> ()) {
        
        let comicEndPointUrl = "http://xkcd.com/\(comicNum)/info.0.json"
        
        NetworkHelper.shared.performingDataTask(with: comicEndPointUrl) { (result) in
            
            switch result{
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do{
                let comic = try JSONDecoder().decode(ComicDataLoad.self, from: data)
                
                completion(.success(comic))
                }
                catch {
                    completion(.failure(.decodingError(error)))
                }
                
            }
        }
        
    }
    
}
