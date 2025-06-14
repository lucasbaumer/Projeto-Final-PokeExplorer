import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()

                Image(systemName: "lock.shield.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.blue)
                    .padding(.bottom, 40)

                Text("Bem-vindo de volta!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Faça login para continuar")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                VStack(spacing: 16) {
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)

                    SecureField("Senha", text: $viewModel.password)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                }
                .padding(.vertical, 30)

                Button(action: {
                    viewModel.login()
                }) {
                    Text("Entrar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)  // cor fixa para teste
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.headline)
                }
                .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)
                .padding(.vertical, 10)

                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .font(.subheadline)
                        .padding(.top, 8)
                }

                Spacer()

                HStack {
                    Text("Ainda não tem uma conta?")
                        .foregroundColor(.gray)
                    NavigationLink("Cadastre-se", destination: RegisterView())
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 30)
            .navigationBarHidden(true)
            .background(Color(UIColor.systemBackground).ignoresSafeArea())
            .fullScreenCover(isPresented: $viewModel.loginSuccess) {
                PokemonListView()
            }
        }
    }
}
