import SwiftUI

struct FavoritesView: View {
    @StateObject var viewModel = FavoritesViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.favorites) { pokemon in
                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                    HStack {
                        AsyncCachedImage(url: URL(string: pokemon.imageUrl))
                            .frame(width: 50, height: 50)

                        Text(pokemon.name.capitalized)
                            .font(.system(size: DesignTokens.FontSizes.body))
                    }
                }
            }
            .navigationTitle("Favoritos")
            .onAppear {
                viewModel.fetchFavorites()
            }
        }
    }
}
