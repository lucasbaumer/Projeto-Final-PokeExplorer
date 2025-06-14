import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        coordinator = Coordinator()

        // Aqui está o que faltava: criar o UIHostingController com a view inicial
        window.rootViewController = UIHostingController(rootView: coordinator!.start())
        self.window = window
        window.makeKeyAndVisible()
    }
}
