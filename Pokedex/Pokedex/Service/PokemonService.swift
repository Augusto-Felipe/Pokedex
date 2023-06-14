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
        let url: String = "https://run.mocky.io/v3/3d1b35c4-205d-4547-99f1-bf1d3df95bd2"
        
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



