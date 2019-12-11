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
    
    func performingDataTask(with request: URLRequest, completion: @escaping (Result<Data, AppError>) -> ()) {
        
    }
}
