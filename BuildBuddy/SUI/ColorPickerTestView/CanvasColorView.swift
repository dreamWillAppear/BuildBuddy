import SwiftUI

struct CanvasColorView: View {
    var redValue: Double
    var greenValue: Double
    var blueValue: Double
    
    var body: some View {
        Color(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255)
            .frame(height: 140)
            .clipShape(.rect(cornerRadius: 25))
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 8)
            )
    }
}

struct CanvasColor_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            CanvasColorView(redValue: 123, greenValue: 123, blueValue: 123)
        }
    }
}
