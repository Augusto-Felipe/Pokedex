//
//  Pokemon.swift
//  Pokedex
//
//  Created by Felipe Augusto Correia on 02/04/23.
//

import Foundation

struct Pokemon: Codable {
    
    let attack: Int
    let defense: Int
    let description: String
    let height: Int
    let id: Int
    let imageUrl: String
    let name: String
    let type: String
}


