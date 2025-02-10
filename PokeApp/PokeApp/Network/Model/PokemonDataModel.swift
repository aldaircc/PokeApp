//
//  PokemonDataModel.swift
//  PokeApp
//
//  Created by Aldair Cosetito Coral on 5/01/25.
//

import Foundation

// MARK: - PokemonResultModel
struct PokemonResultModel: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [PokemonDataModel]
}

extension PokemonResultModel {
    var model: Pokemons {
        results.map { PokemonModel(name: $0.name) }
    }
}

// MARK: - Result
struct PokemonDataModel: Codable {
    let name: String
    let url: String
}
