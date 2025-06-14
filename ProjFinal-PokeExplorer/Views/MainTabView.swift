import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            PokemonListView()
                .tabItem {
                    Label("Pokémons", systemImage: "list.bullet")
                }

            FavoritesView()
                .tabItem {
                    Label("Favoritos", systemImage: "heart.fill")
                }
        }
    }
}
