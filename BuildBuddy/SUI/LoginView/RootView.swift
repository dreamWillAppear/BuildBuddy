import SwiftUI

struct RootView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        ZStack {
            if loginViewVM.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }
    }
}


