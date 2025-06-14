import SwiftUI

struct PokemonDetailView: View {
    @StateObject var viewModel: PokemonDetailViewModel

    init(pokemon: Pokemon) {
        _viewModel = StateObject(wrappedValue: PokemonDetailViewModel(pokemon: pokemon))
    }

    var body: some View {
        ScrollView {
            VStack(spacing: DesignTokens.Spacing.medium) {
                if let detail = viewModel.pokemonDetail {
                    AsyncCachedImage(url: URL(string: detail.sprites.frontDefault ?? viewModel.pokemon.imageUrl))
                        .frame(width: 200, height: 200)

                    Text(detail.name.capitalized)
                        .font(.system(size: DesignTokens.FontSizes.title))
                        .foregroundColor(DesignTokens.Colors.primary)

                    HStack {
                        ForEach(detail.types, id: \.slot) { typeEntry in
                            Text(typeEntry.type.name.capitalized)
                                .padding(8)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(10)
                        }
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Status")
                            .font(.headline)

                        ForEach(detail.stats, id: \.stat.name) { stat in
                            HStack {
                                Text(stat.stat.name.capitalized)
                                    .frame(width: 100, alignment: .leading)
                                Text("\(stat.baseStat)")
                            }
                        }
                    }
                    .padding(.top)

                    Button(action: {
                        withAnimation {
                            viewModel.toggleFavorite()
                        }
                    }) {
                        Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(viewModel.isFavorite ? .red : .gray)
                            .font(.largeTitle)
                    }
                    .padding(.top)
                } else if !viewModel.errorMessage.isEmpty {
                    Text("Erro: \(viewModel.errorMessage)")
                        .foregroundColor(.red)
                } else {
                    ProgressView("Carregando...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .padding()
        }
        .navigationTitle(viewModel.pokemon.name.capitalized)
        .navigationBarTitleDisplayMode(.inline)
    }
}
