import Foundation
import Combine
import SQLite3

class PokemonDetailViewModel: ObservableObject {
    @Published var pokemonDetail: PokemonDetail?
    @Published var isFavorite = false
    @Published var errorMessage = ""

    private var cancellables = Set<AnyCancellable>()
    let pokemon: Pokemon

    // Supondo que você tenha um serviço SQLite para favoritos
    let db = SQLiteService.shared.db

    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        fetchPokemonDetail()
        checkIfFavorite()
    }

    func fetchPokemonDetail() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemon.id)/") else {
            errorMessage = "URL inválida"
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: PokemonDetail.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case let .failure(error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { detail in
                self.pokemonDetail = detail
            }
            .store(in: &cancellables)
    }

    func checkIfFavorite() {
        var stmt: OpaquePointer?
        let query = "SELECT * FROM Favorite WHERE pokemonId = ?"
        if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK {
            sqlite3_bind_int(stmt, 1, Int32(pokemon.id))
            if sqlite3_step(stmt) == SQLITE_ROW {
                isFavorite = true
            } else {
                isFavorite = false
            }
        }
        sqlite3_finalize(stmt)
    }

    func toggleFavorite() {
        if isFavorite {
            removeFavorite()
        } else {
            addFavorite()
        }
    }

    private func addFavorite() {
        var stmt: OpaquePointer?
        let query = "INSERT INTO Favorite (userId, pokemonId, pokemonName) VALUES (?, ?, ?)"
        if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK {
            sqlite3_bind_int(stmt, 1, 1) // Simulando user logado com id 1
            sqlite3_bind_int(stmt, 2, Int32(pokemon.id))
            sqlite3_bind_text(stmt, 3, (pokemon.name as NSString).utf8String, -1, nil)
            if sqlite3_step(stmt) == SQLITE_DONE {
                isFavorite = true
            }
        }
        sqlite3_finalize(stmt)
    }

    private func removeFavorite() {
        var stmt: OpaquePointer?
        let query = "DELETE FROM Favorite WHERE pokemonId = ?"
        if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK {
            sqlite3_bind_int(stmt, 1, Int32(pokemon.id))
            if sqlite3_step(stmt) == SQLITE_DONE {
                isFavorite = false
            }
        }
        sqlite3_finalize(stmt)
    }
}
