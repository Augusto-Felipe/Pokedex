//
//  DetailsVC.swift
//  Pokedex
//
//  Created by Felipe Augusto Correia on 04/04/23.
//

import UIKit

enum PokemonType {
    case poison
    case fire
    case flying
    case water
    case ground
    case grass
    case electric
    case fairy
    case normal
    case ice
    case psychic
}

class DetailsVC: UIViewController {
    
    var screen: DetailsScreen?
    var pokemon: Pokemon?
    
    override func loadView() {
        self.screen = DetailsScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
        setupPokemonDetails()
    }
    
    public func setupPokemonDetails() {
        let typeMappings: [String: PokemonType] = [
            "poison": .poison,
            "fire": .fire,
            "flying": .flying,
            "water": .water,
            "ground": .ground,
            "grass": .grass,
            "electric": .electric,
            "fairy": .fairy,
            "normal": .normal,
            "ice": .ice,
            "psychic": .psychic
        ]
        
        if let pokemonType = typeMappings[pokemon?.type ?? ""] {
            switch pokemonType {
            case .poison:
                view.backgroundColor = .poisonTypeColor
            case .fire:
                view.backgroundColor = .fireTypeColor
            case .flying:
                view.backgroundColor = .flyingTypeColor
            case .water:
                view.backgroundColor = .waterTypeColor
            case .ground:
                view.backgroundColor = .groundTypeColor
            case .grass:
                view.backgroundColor = .grassTypeColor
            case .electric:
                view.backgroundColor = .electricTypeColor
            case .fairy:
                view.backgroundColor = .fairyTypeColor
            case .normal:
                view.backgroundColor = .normalTypeColor
            case .ice:
                view.backgroundColor = .iceTypeColor
            case .psychic:
                view.backgroundColor = .psychicTypeColor
            }
        } else {
            print("Tipo de Pokémon inválido")
        }
        
        if let urlPokemon: URL = URL(string: pokemon?.imageURL ?? "") {
            self.screen?.pokemonImageView.af.setImage(withURL: urlPokemon, placeholderImage: UIImage(named: "threeButtons"))
        }
        self.screen?.pokemonNameLabel.text = pokemon?.name?.capitalized
        self.screen?.pokemonDescriptionLabel.text = pokemon?.description?.capitalized
    }
}
