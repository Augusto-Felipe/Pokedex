//
//  Alert.swift
//  Pokedex
//
//  Created by Felipe Augusto Correia on 15/04/23.
//

import UIKit

class Alert: NSObject {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func createAlert(titulo: String, mensagem: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel) { acao in
            completion?()
        }
        alertController.addAction(ok)
        self.controller.present(alertController, animated: true, completion: nil)
    }
}
