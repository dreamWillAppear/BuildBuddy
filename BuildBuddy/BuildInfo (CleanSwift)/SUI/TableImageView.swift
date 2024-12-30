import SwiftUI

struct TableImageView: View {
    let size: CGSize
    
    var body: some View {
        Image(systemName: "table")
            .resizable()
            .frame(size: size)
            .background(Color(white: 0.9))
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.red, lineWidth: 8))
            .foregroundStyle(.red)
    }
}

struct FrameViewModifier: ViewModifier { //создаем структуру с методом для расширения функцианала - подписываем на ViewModifier
    let size: CGSize
    
    func body(content: Content) -> some View { //запиливыаем функционал
        content
            .frame(width: size.width, height: size.height)
    }
}

extension View { //закидываем функционал через расширение View - у вью теперь есть модификатор .frame с инициализатором size: CGSize
    func frame(size: CGSize) -> some View {
        modifier(FrameViewModifier(size: size))
    }
}

#Preview {
    TableImageView(size: CGSize(width: 200, height: 200))
}
