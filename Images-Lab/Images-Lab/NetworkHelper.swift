//
//  NetworkHelper.swift
//  Images-Lab
//
//  Created by Maitree Bain on 12/11/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    private var session: URLSession
    
    private init() {
        session = URLSession(configuration: .default)
    }
    
    func performingDataTask(with urlString: String, completion: @escaping (Result<Data, AppError>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL(urlString)))
            return
        }
        
        
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.networkClientError(error)))
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            switch urlResponse.statusCode {
                case 200...299: break // everything went well here
                default:
                  completion(.failure(.badStatusCode(urlResponse.statusCode)))
                  return
                }
            
            completion(.success(data))
            }
        dataTask.resume()
        }
    }
