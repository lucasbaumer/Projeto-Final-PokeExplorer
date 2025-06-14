import SwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon
    let loadMore: Bool
    let loadMoreAction: () -> Void

    var body: some View {
        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
            PokemonCardView(pokemon: pokemon)
                .onAppear {
                    if loadMore {
                        loadMoreAction()
                    }
                }
        }
    }
}
