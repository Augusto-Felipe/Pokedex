//
//  DetailsVC.swift
//  Pokedex
//
//  Created by Felipe Augusto Correia on 04/04/23.
//

import UIKit

class DetailsVC: UIViewController {
        
    var pokemon: Pokemon?
    var pokemonImage: UIImage?
    
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
//        lb.text = pokemon?.name.capitalized
        lb.textColor = .white
        lb.font = UIFont.boldSystemFont(ofSize: 22)
        return lb
    }()
    
    lazy var pokemonDescriptionLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
//        lb.text = pokemon?.description
        lb.textColor = .white
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.font = UIFont.systemFont(ofSize: 17)
        return lb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
        self.addElements()
        self.configConstraints()
//        self.configBackgroundColorPokemonType()
    }
    
//    private func configBackgroundColorPokemonType() {
//        if pokemon?.type == "water" {
//            self.view.backgroundColor = UIColor(red: 77/255, green: 143/255, blue: 214/255, alpha: 1.0)
//        } else if pokemon?.type == "flying" {
//            self.view.backgroundColor = UIColor(red: 147/255, green: 170/255, blue: 222/255, alpha: 1.0)
//        } else if pokemon?.type == "ground" {
//            self.view.backgroundColor = UIColor(red: 200/255, green: 181/255, blue: 138/255, alpha: 1.0)
//        } else if pokemon?.type == "grass" || pokemon?.type == "bug" {
//            self.view.backgroundColor = UIColor(red: 101/255, green: 186/255, blue: 91/255, alpha: 1.0)
//        } else if pokemon?.type == "electric" {
//            self.view.backgroundColor = UIColor(red: 244/255, green: 209/255, blue: 58/255, alpha: 1.0)
//        } else if pokemon?.type == "fairy" {
//            self.view.backgroundColor = UIColor(red: 237/255, green: 145/255, blue: 232/255, alpha: 1.0)
//        } else if pokemon?.type == "normal" {
//            self.view.backgroundColor = UIColor(red: 143/255, green: 154/255, blue: 161/255, alpha: 1.0)
//        } else if pokemon?.type == "ice" {
//            self.view.backgroundColor = UIColor(red: 116/255, green: 206/255, blue: 191/255, alpha: 1.0)
//        } else if pokemon?.type == "psychic" {
//            self.view.backgroundColor = UIColor(red: 243/255, green: 113/255, blue: 119/255, alpha: 1.0)
//        } else if pokemon?.type == "fire" {
//            self.view.backgroundColor = UIColor(red: 245/255, green: 157/255, blue: 81/255, alpha: 1.0)
//        } else if pokemon?.type == "poison" {
//            self.view.backgroundColor = UIColor(red: 171/255, green: 106/255, blue: 201/255, alpha: 1.0)
//        }
//    }
    
    private func addElements() {
        self.view.addSubview(pokemonImageView)
        self.view.addSubview(pokemonNameLabel)
        self.view.addSubview(pokemonDescriptionLabel)
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.pokemonImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            self.pokemonImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.pokemonImageView.heightAnchor.constraint(equalToConstant: 200),
            self.pokemonImageView.widthAnchor.constraint(equalToConstant: 200),
            
            
            self.pokemonNameLabel.topAnchor.constraint(equalTo: self.pokemonImageView.bottomAnchor, constant: 20),
            self.pokemonNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            self.pokemonDescriptionLabel.topAnchor.constraint(equalTo: self.pokemonNameLabel.bottomAnchor, constant: 20),
            self.pokemonDescriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            self.pokemonDescriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
        ])
    }
}


