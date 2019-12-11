//
//  PokemonDetailController.swift
//  Images-Lab
//
//  Created by Maitree Bain on 12/11/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class PokemonDetailController: UIViewController {

    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var weakness: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var set: UILabel!
    
    var pokemon: Cards?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        navigationItem.title = pokemon?.name
    }
    
    func loadData() {
        guard let pokemonCard = pokemon else {
            print("not a pokecard")
            return
        }
        
        weakness.text = "Weakness: \(String(describing: pokemonCard.weakness?.value))"
        if pokemonCard.weakness == nil {
            weakness.text = "Weakness: None"
        }
        
        for type in pokemonCard.types ?? ["None"] {
            typeLabel.text = "Type: \(type)"
        }
        
        set.text = pokemonCard.set
        
        ImageClient.getImage(for: pokemonCard.imageUrlHiRes ?? "") { [weak self] (result) in
            
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.pokeImage.image = UIImage(systemName: "xmark")
                    self?.view.backgroundColor = .brown
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.pokeImage.image = image
                    self?.view.backgroundColor = .darkGray
                }
            }
        }
    }
}
