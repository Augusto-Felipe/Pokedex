//
//  PokemonCollectionViewCell.swift
//  NavViewPersonalizada
//
//  Created by Felipe Augusto Correia on 01/04/23.
//

import UIKit
import AlamofireImage

class PokemonCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: PokemonCollectionViewCell.self)
    lazy var screen: PokemonCollectionViewCellScreen = {
        let view = PokemonCollectionViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configElements()
        self.configConstrains()
        self.configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configElements() {
        self.contentView.addSubview(self.screen)
    }
    
    private func configScreen() {
        screen.clipsToBounds = true
        screen.layer.cornerRadius = 20
    }
    
    public func setupCell(pokemon: Pokemon) {
        if let urlPokemon: URL = URL(string: pokemon.imageURL ?? "") {
            screen.pokemonImage.af.setImage(withURL: urlPokemon, placeholderImage: UIImage(named: "threeButtons"))
        }
        screen.pokemonName.text = pokemon.name
    }
    
    private func configConstrains() {
        NSLayoutConstraint.activate([
            self.screen.topAnchor.constraint(equalTo: self.topAnchor),
            self.screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}
