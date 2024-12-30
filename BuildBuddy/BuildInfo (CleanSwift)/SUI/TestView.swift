import SwiftUI

struct TestView: View {
    @State private var sliderValue: Double = 0.5
    @State private var userName: String = ""
    @State private var displayedName = ""
    @State private var isPresented = false
    
    var body: some View {
        
        VStack(spacing: 40) {
            Text(lround(sliderValue).formatted())
                .font(.largeTitle)
            UserNameView(userName: displayedName)
            ColorSliderView(sliderValue: $sliderValue)
            TextField("Enter Your Name", text: $userName)
                .bordered()
            Button("Done", action: checkUserName)
                .alert("Wrong Format", isPresented: $isPresented, actions: {}) {
                    Text("Enter your name!")
                }
            Text("SUI HERE!")
                .font(.system(size: 60))
                .bold()
                .foregroundStyle(.red)
                .background(.blue)
                .padding()
                .background(.red)
                .clipShape(.rect(cornerRadius: 20))

            Spacer()
        }
        .padding()
    }
    
    private func checkUserName() {
        if let _ = Double(userName) {
            isPresented.toggle()
            userName = ""
            return
        }
        
        displayedName = userName
        userName = ""
    }
    
}

#Preview {
    TestView()
}

struct ColorSliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack{
            Text((100 - sliderValue).formatted()).foregroundStyle(.red)
            Slider(value: $sliderValue, in: 0...100, step: 1)
            Text((sliderValue).formatted()).foregroundStyle(.red)
        }
    }
}

extension TextField {
    func bordered() -> some View {
        modifier(BorderedViewModifier())
    }
}

struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.blue)
            )
            .shadow(color: .black.opacity(1), radius: 10, x: 2, y: 2)
    }
}

struct UserNameView: View {
    var userName: String
    
    var body: some View {
        HStack {
            HStack(alignment: .firstTextBaseline) {
                Text("USER NAME:").frame(height: 60)
                Text(userName).font(.largeTitle)
            }
            
            Spacer()
        }
    }
}


