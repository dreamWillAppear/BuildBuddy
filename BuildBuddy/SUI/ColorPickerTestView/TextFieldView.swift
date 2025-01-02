import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    
    let action: () -> Void
    
    var body: some View {
        TextField("0", text: $text)
            .borderedSmallNumField()
            .onChange(of: text) { _ in
                action()
            }
    }
}

struct NumFieldSmallBorderedModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 55, alignment: .trailing)
            .multilineTextAlignment(.trailing)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
    }
}

extension TextField {
    func borderedSmallNumField() -> some View {
        modifier(NumFieldSmallBorderedModifier())
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            TextFieldView(text: .constant("123"), action: {})
        }
    }
}
