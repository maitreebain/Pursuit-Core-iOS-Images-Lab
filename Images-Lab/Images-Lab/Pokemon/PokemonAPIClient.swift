//
//  PokemonAPIClient.swift
//  Images-Lab
//
//  Created by Maitree Bain on 12/11/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

struct PokemonAPIClient {
    
    static func getPokemon(completion: @escaping (Result<[PokemonDataLoad], AppError>) -> ()) {
        
        let endPointURL = "https://api.pokemontcg.io/v1/cards?from=0&to=100"
        
        guard let url = URL(string: endPointURL) else {
            completion(.failure(.badURL(endPointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        
    }
    
}
