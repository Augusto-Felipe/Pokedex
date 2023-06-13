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
}

class HomeViewModel {
    
    private var service: PokemonService = PokemonService()
    private var pokemonList: [Pokemon] = []
    private weak var delegate: HomeViewModelProtocol?
    
    public func delegate(delegate: HomeViewModelProtocol) {
        self.delegate = delegate
    }
    
    public func loadCurrentPokemon(indexPath: IndexPath) -> Pokemon {
        return pokemonList[indexPath.row]
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
