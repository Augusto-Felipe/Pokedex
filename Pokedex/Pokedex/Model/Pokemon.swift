//
//  Pokemon.swift
//  Pokedex
//
//  Created by Felipe Augusto Correia on 12/06/23.
//

import Foundation

// MARK: - Pokemon
struct Pokemon: Codable {
    var attack, defense: Int?
    var description: String?
    var evolutionChain: [EvolutionChain]?
    var height, id: Int?
    var imageURL: String?
    var name, type: String?
    var weight, pokemonDefense: Int?

    enum CodingKeys: String, CodingKey {
        case attack, defense, description, evolutionChain, height, id
        case imageURL = "imageUrl"
        case name, type, weight
        case pokemonDefense = "defense:"
    }
}

// MARK: - EvolutionChain
struct EvolutionChain: Codable {
    var id, name: String?
}

