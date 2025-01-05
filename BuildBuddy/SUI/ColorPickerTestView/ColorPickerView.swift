import SwiftUI

struct ColorPickerView: View {
    @State private var red: Double = (255 * 0.7).rounded()
    @State private var green: Double = (255 * 0.5).rounded()
    @State private var blue: Double = (255 * 0.3).rounded()
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        ZStack {
            
            VStack {
                CanvasColorView(redValue: red, greenValue: green, blueValue: blue)
                    .padding(.bottom, 50)
                ColorSliderView(value: $red, color: .red)
                ColorSliderView(value: $green, color: .green)
                ColorSliderView(value: $blue, color: .blue)
                Spacer()
            }
            .padding()
            .focused($isInputActive)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isInputActive = false
                    }
                }
            }
        }
        .background(Color.cyan)
        .onTapGesture {
            isInputActive = false
        }
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ColorPickerView()
        }
    }
}
