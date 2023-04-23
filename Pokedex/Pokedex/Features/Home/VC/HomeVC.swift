//
//  ViewController.swift
//  NavViewPersonalizada
//
//  Created by Felipe Augusto Correia on 28/03/23.
//

import UIKit

protocol HomeVCProtocol {
    func sendPokemon(pokemon: Pokemon)
}

class HomeVC: UIViewController {
    
    var delegate: HomeVCProtocol?
    
    var homeScreen: HomeScreen?
    
    var pokemonManager = PokemonManager()
    
    var pokemonList: [Pokemon] = []
    
    var pokemonSearch: Pokemon?

    var selectedPokemon: Pokemon?
    
    var alert: Alert?
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.alert = Alert(controller: self)
        pokemonManager.delegate = self
        homeScreen?.configCollectionViewDelegate(delegate: self, datasource: self)
        self.homeScreen?.navView.configTextFieldDelegate(delegate: self)
        self.view = self.homeScreen
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.pokemonManager.pokemonAPIRequest()
        }
        
    }
      
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Se minha buscar por um pokemon retornar algum resultado, vou retornar somente uma célula, caso contrário retorno minha lista de pokemon.
        return pokemonSearch != nil ? 1 : pokemonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Crio minha célula
        let cell: PokemonCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as? PokemonCollectionViewCell
        
        
        // Crio minha célula com o pokemon retornado
        if pokemonSearch != nil {
            cell?.pokemonCollectionViewCellScreen.pokemonName.text = pokemonSearch?.name.capitalized
            cell?.pokemonCollectionViewCellScreen.pokemonType.text = pokemonSearch?.type.capitalized
        }
        
        if let urlString = pokemonSearch?.imageUrl as? String {
            if let imagemUrl = URL(string: urlString) {
                DispatchQueue.global().async {
                    guard let dataImage = try? Data(contentsOf: imagemUrl) else
                    { return }
                    let image = UIImage(data: dataImage)
                    DispatchQueue.main.async {
                        cell?.pokemonCollectionViewCellScreen.pokemonImage.image = image
                    }
                }
            }
            
        // Ou crio minha célula com a lista de todos os pokemons
        } else {
            // Pokemon name and type
            cell?.pokemonCollectionViewCellScreen.pokemonName.text = pokemonList[indexPath.row].name.capitalized
            cell?.pokemonCollectionViewCellScreen.pokemonType.text = pokemonList[indexPath.row].type.capitalized
            
            
            if let urlString = pokemonList[indexPath.row].imageUrl as? String {
                if let imagemUrl = URL(string: urlString) {
                    DispatchQueue.global().async {
                        guard let dataImage = try? Data(contentsOf: imagemUrl) else
                        { return }
                        let image = UIImage(data: dataImage)
                        DispatchQueue.main.async {
                            cell?.pokemonCollectionViewCellScreen.pokemonImage.image = image
                        }
                    }
                }
                
            }
            
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailsVC = DetailsVC()
        
        // Se eu selecionei o pokemon buscado, mostro as informações do mesmo, caso contrário passo o pokemon referente a posição da célula que foi pressionado.
        if let searchedPokemon = pokemonSearch {
            selectedPokemon = searchedPokemon
        } else {
            selectedPokemon = pokemonList[indexPath.row]
        }
        
        
        
        if let urlString = selectedPokemon?.imageUrl as? String {
            if let imagemUrl = URL(string: urlString) {
                DispatchQueue.global().async {
                    guard let dataImage = try? Data(contentsOf: imagemUrl) else
                    { return }
                        let image = UIImage(data: dataImage)
                        DispatchQueue.main.async {
                            detailsVC.pokemonImageView.image = image
                        }
                    }
                }

            }
        
        detailsVC.pokemon = selectedPokemon
        detailsVC.modalPresentationStyle = .formSheet
        navigationController?.present(detailsVC, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 230)
    }
}

extension HomeVC: PokemonManagerProtocol {
    func sendPokemonList(pokemonList: [Pokemon]) {
        DispatchQueue.main.async {
            self.pokemonList = pokemonList
            // Atualiza a interface do usuário com a nova lista de Pokemons
            self.homeScreen?.collectionview.reloadData()
        }
    }
    
    func searchPokemon(pokemon: Pokemon) {
        DispatchQueue.main.async {
            self.pokemonSearch = pokemon
            // Atualiza a interface do usuário com a nova lista de Pokemons
            self.homeScreen?.collectionview.reloadData()
        }
    }
}


extension HomeVC: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.hasText {
            pokemonManager.findPokemon(name: homeScreen?.navView.searchTextField.text ?? "")
        } else {
            pokemonSearch = nil
            self.pokemonManager.pokemonAPIRequest()
            self.homeScreen?.collectionview.reloadData()
        }
    }
}

