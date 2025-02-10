//
//  PokemonDetailModel.swift
//  PokeApp
//
//  Created by Aldair Cosetito Coral on 9/02/25.
//

import Foundation

struct PokemonDetailModel {
    let id: Int
    let name: String
    let order: Int
    let height: Double
    let weight: Double
    let moves: [String]
    let abilities: [String]
    let types: [String]
    let urlImage: URL?
}
