struct PokemonDetail: Codable, Identifiable {
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [TypeEntry]
    let stats: [StatEntry]
    let abilities: [AbilityEntry]

    struct Sprites: Codable {
        let frontDefault: String?

        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
        }
    }

    struct TypeEntry: Codable {
        let slot: Int
        let type: TypeName
    }

    struct TypeName: Codable {
        let name: String
    }

    struct StatEntry: Codable {
        let baseStat: Int
        let stat: StatName

        enum CodingKeys: String, CodingKey {
            case baseStat = "base_stat"
            case stat
        }
    }

    struct StatName: Codable {
        let name: String
    }

    struct AbilityEntry: Codable {
        let ability: AbilityName
    }

    struct AbilityName: Codable {
        let name: String
    }
}
