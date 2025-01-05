import SwiftUI

struct ButtonView: View {
    let color: Color
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: { action() })  {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(width: 200, height: 60)
                .background(color)
                .clipShape(.rect(cornerRadius: 25))
                .overlay {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(lineWidth: 8)
                        .fill(.bar)
                        .shadow(radius: .pi)
                }
        }
    }
}

//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        let contentViewVM: ContentViewViewModel = ContentViewViewModel()
//        
//        ZStack {
//            ButtonView(contentViewVM: contentViewVM)
//        }
//    }
//}
