import Foundation
import Combine

class RegisterViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    func register(completion: @escaping (Bool) -> Void) {
        // Simulação de chamada para criar usuário (troque pela sua lógica real)

        // Limpa erros antes de tentar
        errorMessage = ""

        // Simula atraso para cadastro
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            // Exemplo: validação simples
            if self.username.isEmpty || self.email.isEmpty || self.password.isEmpty {
                DispatchQueue.main.async {
                    self.errorMessage = "Preencha todos os campos."
                    completion(false)
                }
                return
            }

            // Simula sucesso
            DispatchQueue.main.async {
                completion(true)
            }
        }
    }
}
