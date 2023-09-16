//
//  DetailsScreen.swift
//  Pokedex
//
//  Created by Felipe Augusto Correia on 14/06/23.
//

import UIKit

class DetailsScreen: UIView {

    lazy var pokemonImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
        image.tintColor = .white
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var pokemonNameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.font = UIFont.boldSystemFont(ofSize: 22)
        return lb
    }()
    
    lazy var pokemonDescriptionLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(pokemonImageView)
        addSubview(pokemonNameLabel)
        addSubview(pokemonDescriptionLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.pokemonImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            self.pokemonImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.pokemonImageView.heightAnchor.constraint(equalToConstant: 200),
            self.pokemonImageView.widthAnchor.constraint(equalToConstant: 200),
            
            self.pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: 20),
            self.pokemonNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            self.pokemonDescriptionLabel.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: 20),
            self.pokemonDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            self.pokemonDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
        ])
    }
}
