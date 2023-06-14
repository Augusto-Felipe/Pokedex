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
    func pokemonFound()
}

class HomeViewModel {
    
    private var service: PokemonService = PokemonService()
    private var pokemonList: [Pokemon] = []
    private var searchPokemonList: [Pokemon] = []
    private weak var delegate: HomeViewModelProtocol?
    
    public func delegate(delegate: HomeViewModelProtocol) {
        self.delegate = delegate
    }
    
    public func loadCurrentPokemon(indexPath: IndexPath) -> Pokemon {
        return pokemonList[indexPath.row]
    }
    
    func searchPokemon(with searchText: String) {
        if pokemonList.contains(where: {$0.name == searchText}) {
            // it exists, do something
            print("achei")
        } else {
            //item could not be found
            print("nao achei")
        }
        
        if let searchedPokemon = pokemonList.first(where: {$0.name == searchText}) {
            // do something with foo
            pokemonList = [searchedPokemon]
            self.delegate?.pokemonFound()
        } else if searchText.isEmpty {
            
        }
        
    }
    
    
    var numberOfItens: Int {
        pokemonList.count
    }
    
    public func fetchAllRequest() {
        service.getPokemonDataAlamofire { pokemonData, error in
            if error != nil {
                self.delegate?.error()
            } else {
                self.pokemonList = pokemonData?.pokemon ?? []
                self.delegate?.sucess()
            }
        }
    }
}
