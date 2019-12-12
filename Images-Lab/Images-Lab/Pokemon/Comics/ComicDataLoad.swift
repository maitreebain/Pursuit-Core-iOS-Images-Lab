//
//  ComicDataLoad.swift
//  Images-Lab
//
//  Created by Maitree Bain on 12/12/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct ComicDataLoad: Decodable {
    let month: String
    let num: Int
    let year: String
    let title: String
    let img: String
    let day: String
}
