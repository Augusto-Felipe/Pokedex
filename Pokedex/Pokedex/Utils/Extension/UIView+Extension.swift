//
//  PokemonCollectionViewCell + Extension.swift
//  Pokedex
//
//  Created by Felipe Augusto Correia on 01/04/23.
//

import Foundation
import UIKit

extension UIView {
    func setCardShadow() {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 8
        layer.shouldRasterize = true
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
    }
}

