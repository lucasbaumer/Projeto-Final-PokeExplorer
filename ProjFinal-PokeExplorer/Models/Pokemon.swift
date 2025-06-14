import Foundation

struct PokemonResponse: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let name: String
    let url: String

    var id: Int {
        if let number = url.split(separator: "/").compactMap({ Int($0) }).last {
            return number
        }
        return 0
    }

    var imageUrl: String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
    }
}
