//
//  PokemonPresenter.swift
//  PokeApp
//
//  Created by Aldair Cosetito Coral on 5/01/25.
//

import Foundation

final class PokemonPresenter: ObservableObject {
    @Published var pokemons: Pokemons = []
    private let pokemonUseCase: PokemonUseCaseProtocol
    
    init(pokemonUseCase: PokemonUseCaseProtocol = PokemonUseCase()) {
        self.pokemonUseCase = pokemonUseCase
    }
    
    func onAppear() {
        getPokemons()
    }
    
    private func getPokemons() {
        pokemonUseCase.getPokemons { result in
            switch result {
            case .success(let data):
                Task {
                    await MainActor.run {
                        self.pokemons = data
                    }
                }
            case .failure:
                return
            }
        }
    }
}
