//
//  AppError.swift
//  Images-Lab
//
//  Created by Maitree Bain on 12/10/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

enum AppError: Error {
      case badURL(String)
      case noResponse
      case networkClientError(Error)
      case noData
      case decodingError(Error)
      case badStatusCode(Int)
      case badMimeType(String)
}
