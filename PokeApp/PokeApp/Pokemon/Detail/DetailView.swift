//
//  DetailView.swift
//  PokeApp
//
//  Created by Aldair Cosetito Coral on 5/01/25.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var vm: DetailPresenter
    
    var body: some View {
        VStack {
            AsyncImage(url: vm.model?.urlImage)
            List {
                Section("Information") {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 10) {
                            Text("Name:")
                            Text(vm.model?.name ?? "")
                        }
                        Divider()
                        HStack(spacing: 10) {
                            Text("Height:")
                            Text("\(vm.model?.height ?? 0.0)")
                        }
                        Divider()
                        HStack(spacing: 10) {
                            Text("Weight:")
                            Text("\(vm.model?.weight ?? 0.0)")
                        }
                    }
                }
                
                Section("Abilities") {
                    ForEach(vm.model?.abilities ?? [], id: \.self) { ability in
                        Text(ability)
                    }
                }
                
                Section("Moves") {
                    ForEach(vm.model?.moves ?? [], id: \.self) { move in
                        Text(move)
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
    DetailView(vm: DetailPresenter(pokemon: ""))
}
