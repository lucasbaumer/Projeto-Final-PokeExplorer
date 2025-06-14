import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var loginSuccess = false
    @Published var errorMessage = ""

    func login() {
        let success = AuthService().login(email: email, password: password)
        if success {
            loginSuccess = true
        } else {
            errorMessage = "Email ou senha inválidos"
        }
    }
}
