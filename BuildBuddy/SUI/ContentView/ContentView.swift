import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var contentViewVM: ContentViewViewModel
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack() {
            Text("\(loginViewVM.username) there!")
                .fontWeight(.semibold)
            
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(
                color: .red,
                title: contentViewVM.buttonTitile,
                action: contentViewVM.startTimer
            )
            
            Spacer()
            
            ButtonView(
                color: .blue,
                title: "Logout",
                action: { loginViewVM.didTapLogoutButton() }
            )
        }
        .padding(EdgeInsets(top: 25, leading: 16, bottom: 16, trailing: 25))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
           ContentView()
                .environmentObject(ContentViewViewModel())
                .environmentObject(LoginViewViewModel())
        }
    }
}



