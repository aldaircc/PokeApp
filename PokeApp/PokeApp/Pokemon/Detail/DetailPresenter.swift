//
//  DetailPresenter.swift
//  PokeApp
//
//  Created by Aldair Cosetito Coral on 5/01/25.
//

import Foundation

final class DetailPresenter: ObservableObject {
    private let useCase: PokemonDetailUseCaseProtocol
    private let pokemon: String
    @Published var model: PokemonDetailModel?
    
    init(useCase: PokemonDetailUseCaseProtocol = PokemonDetailUseCase(), pokemon: String) {
        self.useCase = useCase
        self.pokemon = pokemon
    }
    
    func onAppear() {
        useCase.getPokemonDetail(for: pokemon) { result in
            switch result {
            case .success(let value):
                Task {
                    await MainActor.run {
                        self.model = value
                    }
                }
            case .failure:
                debugPrint("Error at consuming api")
            }
        }
    }
}
