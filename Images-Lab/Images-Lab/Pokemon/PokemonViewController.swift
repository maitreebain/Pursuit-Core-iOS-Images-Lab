//
//  PokemonViewController.swift
//  Images-Lab
//
//  Created by Maitree Bain on 12/11/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemon = [Cards]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var searchQuery = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        loadData()
        searchBarQuery()
    }
    
    
    func loadData() {
        PokemonAPIClient.getPokemon { (result) in
            
            switch result{
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let cards):
                DispatchQueue.main.async {
                    self.pokemon = cards
                    dump(cards)
                }
            }
        }
    }
    
    func searchBarQuery() {
        pokemon = pokemon.filter{ (($0.types?.first?.description.contains(searchQuery.lowercased()))!) }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let pokemonDetailController = segue.destination as? PokemonDetailController,
            let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("no segue found")
        }
        let selectedPokemon = pokemon[indexPath.row]
        
        pokemonDetailController.pokemon = selectedPokemon
    }

}

extension PokemonViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokeBall", for: indexPath)
        
        let selectedPoke = pokemon[indexPath.row]
        
        cell.textLabel?.text = selectedPoke.name
        
        return cell
    }
    
}

extension PokemonViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if !searchText.isEmpty {
            loadData()
            searchBarQuery()
            return
        }
        
        searchQuery = searchText
        
    }
}
