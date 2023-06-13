//
//  PokemonCollectionViewCellScreen.swift
//  NavViewPersonalizada
//
//  Created by Felipe Augusto Correia on 01/04/23.
//

import UIKit

class PokemonCollectionViewCellScreen: UIView {
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.setCardShadow()
        return view
    }()
    
    lazy var pokemonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var pokemonName: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        lb.clipsToBounds = true
        lb.layer.cornerRadius = 8
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.textColor = .black
        return lb
    }()
    
    lazy var pokemonType: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        return lb
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.configConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(cardView)
        cardView.addSubview(pokemonImage)
        cardView.addSubview(pokemonName)
        cardView.addSubview(pokemonType)
    }
    
    private func configConstrains() {
        NSLayoutConstraint.activate([
            self.cardView.topAnchor.constraint(equalTo: self.topAnchor),
            self.cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.pokemonImage.topAnchor.constraint(equalTo: self.cardView.topAnchor, constant: 10),
            self.pokemonImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.pokemonImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            self.pokemonImage.heightAnchor.constraint(equalToConstant: 150),
            
            self.pokemonName.topAnchor.constraint(equalTo: self.pokemonImage.bottomAnchor, constant: 10),
            self.pokemonName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.pokemonType.topAnchor.constraint(equalTo: self.pokemonName.bottomAnchor, constant: 10),
            self.pokemonType.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
        ])
    }
}
