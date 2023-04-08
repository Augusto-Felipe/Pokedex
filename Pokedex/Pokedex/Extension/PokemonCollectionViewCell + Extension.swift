//
//  PokemonCollectionViewCell + Extension.swift
//  Pokedex
//
//  Created by Felipe Augusto Correia on 01/04/23.
//

import Foundation
import UIKit

extension PokemonCollectionViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cornerRadius: CGFloat = 20.0
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

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


extension UIColor {
    
    @nonobjc class var appBackGround: UIColor {
        return UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
    }
    
    
}
