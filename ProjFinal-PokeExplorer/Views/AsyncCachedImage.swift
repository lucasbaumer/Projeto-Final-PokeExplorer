import SwiftUI
import UIKit

struct AsyncCachedImage: View {
    @State private var uiImage: UIImage? = nil
    let url: URL?

    var body: some View {
        Group {
            if let uiImage = uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
                    .onAppear(perform: loadImage)
            }
        }
    }

    private func loadImage() {
        guard let url = url else { return }

        if let cachedImage = ImageCache.shared.image(forKey: url.absoluteString) {
            self.uiImage = cachedImage
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let image = UIImage(data: data) {
                ImageCache.shared.setImage(image, forKey: url.absoluteString)
                DispatchQueue.main.async {
                    self.uiImage = image
                }
            }
        }.resume()
    }
}
