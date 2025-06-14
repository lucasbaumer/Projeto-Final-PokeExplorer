import Foundation

class APIService {
    func fetchPokemons(offset: Int, limit: Int, completion: @escaping ([Pokemon]) -> Void) {
        let urlString = "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=\(limit)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            let response = try? JSONDecoder().decode(PokemonResponse.self, from: data)
            DispatchQueue.main.async {
                completion(response?.results ?? [])
            }
        }.resume()
    }
}
