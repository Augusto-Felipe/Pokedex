//
//  PokemonCollectionViewCell.swift
//  NavViewPersonalizada
//
//  Created by Felipe Augusto Correia on 01/04/23.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PokemonCollectionViewCell"
    
    lazy var pokemonCollectionViewCellScreen: PokemonCollectionViewCellScreen = {
        let view = PokemonCollectionViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configElements()
        self.configConstrains()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configElements() {
        self.contentView.addSubview(self.pokemonCollectionViewCellScreen)
    }
    
    private func configConstrains() {
        
        NSLayoutConstraint.activate([
            
            self.pokemonCollectionViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.pokemonCollectionViewCellScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.pokemonCollectionViewCellScreen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.pokemonCollectionViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}
