//
//  PokemonDetailEntity.swift
//  PokeApp
//
//  Created by Aldair Cosetito Coral on 5/01/25.
//

import Foundation

struct PokemonDetailEntity: Codable {
    let abilities: [AbilityEntity]?
    let baseExperience: Int?
    let cries: CriesEntity?
    let forms: [SpeciesEntity]?
    let gameIndices: [GameIndexEntity]?
    let height: Int?
    let id: Int
    let isDefault: Bool?
    let locationAreaEncounters: String?
    let moves: [MoveEntity]?
    let name: String
    let order: Int
    let types: [TypeElementEntity]
    let weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case cries, forms
        case gameIndices = "game_indices"
        case height
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order
        case types, weight
    }
}

extension PokemonDetailEntity {
    var model: PokemonDetailModel {
        let moves = self.moves?.compactMap({ $0.move?.name }) ?? []
        let abilities = self.abilities?.compactMap({ $0.ability?.name }) ?? []
        let types = self.types.compactMap { $0.type?.name }
        let imageUrl = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
        return PokemonDetailModel(id: id,
                                  name: name,
                                  order: order,
                                  height: Double(height ?? 0),
                                  weight: Double(weight),
                                  moves: moves,
                                  abilities: abilities,
                                  types: types,
                                  urlImage: imageUrl)
    }
}

// MARK: - Ability
struct AbilityEntity: Codable {
    let ability: SpeciesEntity?
    let isHidden: Bool?
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Species
struct SpeciesEntity: Codable {
    let name: String?
    let url: String?
}

// MARK: - Cries
struct CriesEntity: Codable {
    let latest: String?
    let legacy: String?
}

// MARK: - GameIndex
struct GameIndexEntity: Codable {
    let gameIndex: Int?
    let version: SpeciesEntity?

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

// MARK: - Move
struct MoveEntity: Codable {
    let move: SpeciesEntity?
    let versionGroupDetails: [VersionGroupDetailEntity]?

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: - VersionGroupDetail
struct VersionGroupDetailEntity: Codable {
    let levelLearnedAt: Int?
    let moveLearnMethod: SpeciesEntity?
    let versionGroup: SpeciesEntity?

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

// MARK: - GenerationI
struct GenerationIEntity: Codable {
    let redBlue: RedBlueEntity?
    let yellow: RedBlueEntity?

    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow
    }
}

// MARK: - RedBlue
struct RedBlueEntity: Codable {
    let backDefault: String?
    let backGray: String?
    let backTransparent: String?
    let frontDefault: String?
    let frontGray: String?
    let frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - GenerationIi
struct GenerationIiEntity: Codable {
    let crystal: CrystalEntity?
    let gold: GoldEntity?
    let silver: GoldEntity?
}

// MARK: - Crystal
struct CrystalEntity: Codable {
    let backDefault: String?
    let backShiny: String?
    let backShinyTransparent: String?
    let backTransparent: String?
    let frontDefault: String?
    let frontShiny: String?
    let frontShinyTransparent: String?
    let frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case backShinyTransparent = "back_shiny_transparent"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontShinyTransparent = "front_shiny_transparent"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - Gold
struct GoldEntity: Codable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
    let frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - GenerationIii
struct GenerationIiiEntity: Codable {
    let emerald: OfficialArtworkEntity?
    let fireredLeafgreen: GoldEntity?
    let rubySapphire: GoldEntity?

    enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
}

// MARK: - OfficialArtwork
struct OfficialArtworkEntity: Codable {
    let frontDefault: String?
    let frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

// MARK: - Stat
struct StatEntity: Codable {
    let baseStat: Int?
    let effort: Int?
    let stat: SpeciesEntity?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: - TypeElement
struct TypeElementEntity: Codable {
    let slot: Int?
    let type: SpeciesEntity?
}
