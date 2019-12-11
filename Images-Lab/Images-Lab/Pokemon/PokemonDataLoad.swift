//
//  PokemonDataLoad.swift
//  Images-Lab
//
//  Created by Maitree Bain on 12/11/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct PokemonDataLoad: Decodable {
    let cards: [Cards]
}

struct Cards: Decodable {
    let name: String
    let imageUrlHiRes: String
    let types: [String]
    let weakness: Weakness?
    let set: String
}

struct Weakness: Decodable {
    let type: String?
    let value: String
}
