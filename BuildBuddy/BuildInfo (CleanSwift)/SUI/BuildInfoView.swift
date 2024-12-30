import SwiftUI

private enum SemaphoreLightStates {
    case off
    case red
    case yellow
    case green
}

struct BuildInfoView: View {
    @State private var currentSemaphoreState: SemaphoreLightStates = .off
    @State private var buttonLabel = "START"
    
    var body: some View {
      
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
               
                Button(action: didTapSemaphoreButton) {
                    Text(buttonLabel)
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
                .frame(width: 135, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 3)
                )
            }
        }
    }
    
    private func didTapSemaphoreButton() {
        switch currentSemaphoreState {
            case .off:
                currentSemaphoreState = .red
                buttonLabel = "NEXT"
            case .red:
                currentSemaphoreState = .yellow
            case .yellow:
                currentSemaphoreState = .green
            case .green:
                currentSemaphoreState = .off
                buttonLabel = "START"
        }
    }
    
}

#Preview {
    BuildInfoView()
}
