//
//  ViewController.swift
//  NavViewPersonalizada
//
//  Created by Felipe Augusto Correia on 28/03/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var viewModel: HomeViewModel = HomeViewModel()
    var homeScreen: HomeScreen?
    var pokemonService = PokemonService()
    var alert: Alert?
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = self.homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        self.alert = Alert(controller: self)
        self.homeScreen?.navView.configTextFieldDelegate(delegate: self)
        viewModel.fetchAllRequest()
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PokemonCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as? PokemonCollectionViewCell
        cell?.setupCell(pokemon: viewModel.loadCurrentPokemon(indexPath: indexPath))
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItens
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 230)
    }
}

extension HomeVC: HomeViewModelProtocol {
    func sucess() {
        self.homeScreen?.configCollectionViewDelegate(delegate: self, datasource: self)
    }
    
    func error() {
        
    }
    
    func pokemonFound() {
        self.homeScreen?.collectionview.reloadData()
    }
    
}

extension HomeVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let inputText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else { return false }
        viewModel.searchPokemon(with: inputText)
        return true
    }
}


