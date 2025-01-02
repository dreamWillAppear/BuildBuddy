import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @State private var text = ""
    @State private var showAlert = false
    
    let color: Color
    
    var body: some View {
        HStack {
            Text(text).foregroundStyle(.white)
                .frame(width: 50)
            Slider(
                value: Binding(
                    get: { value },
                    set: { newValue in
                        value = newValue
                        text = newValue.formatted()
                    }
                ),
                in: 0...255,
                step: 1)
            .tint(color)
            
            TextFieldView(text: $text) {
                updateValue()
            }
            
            .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
                Text("Please enter value from 0 to 255")
            }
        }
        .onAppear {
            text = value.formatted()
        }
        
    }
    
    private func updateValue() {
        guard let value = Double(text) else {
            self.value = 0
            text = "0"
            return
        }
        
        withAnimation {
            if value > 255 {
                self.value = 255
                text = "255"
            }
            
            if value < 0 {
                self.value = 0
                text = "0"
            }
        }
        
        self.value = value
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            ColorSliderView(value: .constant(123), color: .red)
        }
    }
}
