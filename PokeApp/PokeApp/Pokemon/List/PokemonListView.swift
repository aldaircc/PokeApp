//
//  PokemonListView.swift
//  PokeApp
//
//  Created by Aldair Cosetito Coral on 5/01/25.
//

import SwiftUI

struct PokemonListView: View {
    @ObservedObject var vm: PokemonPresenter
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(vm.pokemons, id: \.name) { pokemon in
                    NavigationLink(pokemon.name) {
                        DetailView(vm: DetailPresenter(pokemon: pokemon.name))
                    }
                }
            }
        }
        .onAppear {
            vm.onAppear()
        }
    }
}

#Preview {
    PokemonListView(vm: PokemonPresenter())
}
