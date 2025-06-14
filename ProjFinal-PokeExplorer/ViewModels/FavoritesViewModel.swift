import Foundation
import SQLite3

class FavoritesViewModel: ObservableObject {
    @Published var favorites: [Pokemon] = []
    let db = SQLiteService.shared.db

    func fetchFavorites() {
        favorites.removeAll()
        var stmt: OpaquePointer?
        let query = "SELECT pokemonId, pokemonName FROM Favorite"

        if sqlite3_prepare(db, query, -1, &stmt, nil) == SQLITE_OK {
            while sqlite3_step(stmt) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(stmt, 0))
                let name = String(cString: sqlite3_column_text(stmt, 1))
                favorites.append(Pokemon(name: name, url: "https://pokeapi.co/api/v2/pokemon/\(id)/"))
            }
        }
        sqlite3_finalize(stmt)
    }
}
