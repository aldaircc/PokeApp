//
//  PokeAppApp.swift
//  PokeApp
//
//  Created by Aldair Cosetito Coral on 22/12/24.
//

import SwiftUI

@main
struct PokeAppApp: App {
    var body: some Scene {
        WindowGroup {
            PokemonListView(vm: PokemonPresenter())
        }
    }
}
