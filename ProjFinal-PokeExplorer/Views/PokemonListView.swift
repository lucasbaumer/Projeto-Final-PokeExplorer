import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel = PokemonListViewModel()

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.pokemons) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            VStack {
                                AsyncCachedImage(url: URL(string: pokemon.imageUrl))
                                    .frame(width: 80, height: 80)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                
                                Text(pokemon.name.capitalized)
                                    .font(.caption)
                                    .foregroundColor(.primary)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(radius: 2)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Pokémons")
            .navigationBarItems(trailing:
                NavigationLink(destination: FavoritesView()) {
                    HStack(spacing: 4) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                        Text("Favoritos")
                    }
                    .font(.headline)
                }
            )
            .onAppear {
                viewModel.fetchPokemons()
            }
        }
    }
}
