//
//  PokemonUseCase.swift
//  PokeApp
//
//  Created by Aldair Cosetito Coral on 6/01/25.
//

import Foundation

protocol PokemonUseCaseProtocol {
    func getPokemons(completion: @escaping (Result<Pokemons, Error>) -> Void)
}

struct PokemonUseCase {
    // Instance of repository to call to the network layer
    private let network: NetworkProtocol
    private var page = 0
    
    init(network: NetworkProtocol = NetworkManager()) {
        self.network = network
    }
}

extension PokemonUseCase: PokemonUseCaseProtocol {
    func getPokemons(completion: @escaping (Result<Pokemons, Error>) -> Void) { 
        guard let request = ApiType.pokemonList(page: page).request() else {
            completion(.failure(NSError(domain: "Bad url", code: -1)))
            return
        }
        
        network.executeRequest(request) { (result: Result<PokemonResultModel, Error>) in
            switch result {
            case .success(let data):
                completion(.success(data.model))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
