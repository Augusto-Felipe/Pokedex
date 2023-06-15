//
//  UIColor+Extension.swift
//  Pokedex
//
//  Created by Felipe Augusto Correia on 23/04/23.
//

import Foundation
import UIKit

extension UIColor {
    
    @nonobjc class var appBackGround: UIColor {
        return UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
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
}
