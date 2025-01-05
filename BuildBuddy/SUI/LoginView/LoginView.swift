import SwiftUI
import Combine

struct LoginView: View {
    @EnvironmentObject private var logginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your username here", text: $logginViewVM.username)
                    .multilineTextAlignment(.center)
                    .textContentType(.nickname)
                UsernameValidateCounterView(
                    isValid: logginViewVM.usernameIsValid,
                    counter: logginViewVM.username.count
                )
                .offset(x: -40)
            }
                
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(!logginViewVM.usernameIsValid)
            
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
    
    private func login() {
        logginViewVM.didTapLoginButton()
    }
}

struct UsernameValidateCounterView: View {
 var isValid: Bool
    var counter: Int
    
    private var color: Color {
        isValid ? .green : .red
    }
    
    var body: some View {
        Text(counter.formatted())
            .foregroundStyle(color)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LoginView()
                .environmentObject(LoginViewViewModel())
        }
    }
}

