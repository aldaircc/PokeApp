//
//  PokemonDetailUseCase.swift
//  PokeApp
//
//  Created by Aldair Cosetito Coral on 3/02/25.
//

import Foundation

protocol PokemonDetailUseCaseProtocol {
    func getPokemonDetail(for value: String, completion: @escaping (Result<PokemonDetailModel, Error>) -> Void)
}

struct PokemonDetailUseCase {
    let network: NetworkProtocol
    
    init(network: NetworkProtocol = NetworkManager()) {
        self.network = network
    }
}

extension PokemonDetailUseCase: PokemonDetailUseCaseProtocol {
    func getPokemonDetail(for value: String, completion: @escaping (Result<PokemonDetailModel, Error>) -> Void) {
        guard let request = ApiType.pokeDetail(value: value).request() else {
            return
        }
        network.executeRequest(request) { (result: Result<PokemonDetailEntity, Error>) in
            switch result {
            case .success(let value):
                completion(.success(value.model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
