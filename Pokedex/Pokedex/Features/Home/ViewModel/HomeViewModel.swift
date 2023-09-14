//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Felipe Augusto Correia on 12/06/23.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func sucess()
    func error()
    func reloadCollectionView()
}

class HomeViewModel {
    
    private var service: PokemonService = PokemonService()
    private var pokemonList: [Pokemon] = []
    private var filteredPokemonList: [Pokemon] = []
    private weak var delegate: HomeViewModelProtocol?
    
    public func delegate(delegate: HomeViewModelProtocol) {
        self.delegate = delegate
    }
    
    public func loadCurrentPokemon(indexPath: IndexPath) -> Pokemon {
        return filteredPokemonList[indexPath.row]
    }
    
    var numberOfItens: Int {
        filteredPokemonList.count
    }
    
    func searchPokemon(with searchText: String) {
        if searchText.isEmpty {
            filteredPokemonList = pokemonList
        } else {
            filteredPokemonList = pokemonList.filter { ($0.name?.lowercased() ?? "").hasPrefix(searchText.lowercased()) }
        }
        
        self.delegate?.reloadCollectionView()
    }
    
    public func fetchAllRequest() {
        service.getPokemonDataAlamofire { pokemonData, error in
            if error != nil {
                self.delegate?.error()
            } else {
                self.pokemonList = pokemonData?.pokemon ?? []
                self.filteredPokemonList = self.pokemonList
                self.delegate?.sucess()
            }
        }
    }
}
