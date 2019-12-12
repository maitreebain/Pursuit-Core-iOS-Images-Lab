//
//  RandomUserDataLoad.swift
//  Images-Lab
//
//  Created by Maitree Bain on 12/12/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct RandomUsersDataLoad: Decodable {
    let results: [RandomUsers]
}

struct RandomUsers: Decodable {
    let name: Name
    let dob: Age
    let cell: String
    let picture: Pictures
}

struct Name: Decodable {
    let first: String
    let last: String
}

struct Pictures: Decodable {
    let large: String
    let thumbnail: String
}

struct Age: Decodable {
    let age: Int
}
