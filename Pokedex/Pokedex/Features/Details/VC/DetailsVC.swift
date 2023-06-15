//
//  DetailsVC.swift
//  Pokedex
//
//  Created by Felipe Augusto Correia on 04/04/23.
//

import UIKit

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
        //        self.configBackgroundColorPokemonType()
    }
    
    public func setupPokemonDetails() {
        if let urlPokemon: URL = URL(string: pokemon?.imageURL ?? "") {
            self.screen?.pokemonImageView.af.setImage(withURL: urlPokemon, placeholderImage: UIImage(named: "threeButtons"))
        }
        self.screen?.pokemonNameLabel.text = pokemon?.name?.capitalized
        self.screen?.pokemonDescriptionLabel.text = pokemon?.description?.capitalized
    }
}
