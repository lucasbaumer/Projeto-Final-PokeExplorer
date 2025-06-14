import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()

    @Environment(\.presentationMode) var presentationMode
    @State private var showSuccessAlert = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Text("Crie sua conta")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)

            VStack(spacing: 16) {
                TextField("Usuário", text: $viewModel.username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8)

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
                viewModel.register { success in
                    if success {
                        showSuccessAlert = true
                    }
                }
            }) {
                Text("Cadastrar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.headline)
            }
            .disabled(
                viewModel.username.isEmpty ||
                viewModel.email.isEmpty ||
                viewModel.password.isEmpty
            )
            .padding(.vertical, 10)

            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .font(.subheadline)
                    .padding(.top, 8)
            }

            Spacer()
        }
        .padding(.horizontal, 30)
        .navigationTitle("Cadastro")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(UIColor.systemBackground).ignoresSafeArea())
        .alert(isPresented: $showSuccessAlert) {
            Alert(
                title: Text("Sucesso"),
                message: Text("Conta criada com sucesso!"),
                dismissButton: .default(Text("OK")) {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}
