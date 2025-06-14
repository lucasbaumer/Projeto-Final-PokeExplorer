import SwiftUI

struct PokemonCardView: View {
    let pokemon: Pokemon

    var body: some View {
        VStack {
            AsyncCachedImage(url: URL(string: pokemon.imageUrl))
                .frame(width: 80, height: 80)
                .scaleEffect(0.9)
                .animation(Animation.easeInOut, value: pokemon.id)

            Text(pokemon.name.capitalized)
                .font(.system(size: DesignTokens.FontSizes.body))
                .foregroundColor(DesignTokens.Colors.primary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}
