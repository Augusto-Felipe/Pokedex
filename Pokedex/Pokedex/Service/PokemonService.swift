//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Felipe Augusto Correia on 02/04/23.
//

import Foundation
import Alamofire


struct PokemonService {
    
    func getPokemonDataAlamofire(completion: @escaping (PokemonData?, Error?) -> Void) {
        let url: String = "https://run.mocky.io/v3/d812938c-132b-41f0-b602-18cbc11d3f96"
        
        AF.request(url, method: .get).validate().responseDecodable(of: PokemonData.self) { response in
            
            debugPrint(response)
            
            switch response.result {
            case .success(let sucess):
                print("SUCESS -> \(#function)")
                completion(sucess, nil)
            case .failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, error)
            }
        }
    }
}


//struct PokemonManager {
//
//    var delegate: PokemonManagerProtocol?
//
//    public func pokemonAPIRequest() {
//
//        let apiUrl = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json")
//
//        let session = URLSession.shared
//        let request = URLRequest(url: apiUrl!)
//
//        let task = session.dataTask(with: request) { data, response, error in
//
//            if error != nil {
//                print("Ocorreu um erro:")
//
//            } else {
//                print("sucesso")
//
//                guard let responseData = data else { return }
//
//                do {
//                    if let parsedData = responseData.parseData(nullString: "null,") {
//                        let pokemons = try JSONDecoder().decode([Pokemon].self, from: parsedData)
//                        delegate?.sendPokemonList(pokemonList: pokemons)
//                        print(pokemons.count)
//                    }
//
//                } catch let error {
//
//                   print(error)
//                }
//            }
//        }
//
//        task.resume()
//    }
//
//
//    public func findPokemon(name: String) {
//
//        let apiUrl = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json")
//
//
//        let session = URLSession.shared
//        let request = URLRequest(url: apiUrl!)
//
//        let task = session.dataTask(with: request) { data, response, error in
//
//            if error != nil {
//                print("Ocorreu um erro:")
//
//            } else {
//                print("sucesso")
//
//                guard let responseData = data else { return }
//
//                do {
//                    if let parsedData = responseData.parseData(nullString: "null,") {
//                        let pokemons = try JSONDecoder().decode([Pokemon].self, from: parsedData)
//
//
//                        for pokemon in pokemons {
//                            if pokemon.name == name {
//                                delegate?.searchPokemon(pokemon: pokemon)
//                            } else {
//                                print("Nome invalido.")
//                            }
//                        }
//                    }
//
//                } catch let error {
//
//                    print(error)
//                }
//            }
//        }
//
//        task.resume()
//    }
//
//}
//
//
//extension Data {
//    func parseData(nullString word: String) -> Data? {
//        let dataAsString = String(data: self, encoding: .utf8)
//        let parsedDataString = dataAsString?.replacingOccurrences(of: word, with: "")
//        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
//        return data
//    }
//}


