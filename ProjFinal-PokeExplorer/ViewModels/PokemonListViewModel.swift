import Foundation

class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var isLoading = false
    private var offset = 0
    private let limit = 20
    private let apiService = APIService()

    func fetchPokemons() {
        guard !isLoading else { return }
        isLoading = true
        apiService.fetchPokemons(offset: offset, limit: limit) { [weak self] newPokemons in
            self?.pokemons.append(contentsOf: newPokemons)
            self?.offset += self?.limit ?? 0
            self?.isLoading = false
        }
    }
}
