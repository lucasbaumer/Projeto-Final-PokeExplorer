import UIKit
import SwiftUI

class Coordinator: ObservableObject {
    @Published var isLoggedIn = false

    func start() -> some View {
        if isLoggedIn {
            return AnyView(MainTabView())
        } else {
            return AnyView(LoginView().environmentObject(self))
        }
    }

    func logout() {
        isLoggedIn = false
    }
}
