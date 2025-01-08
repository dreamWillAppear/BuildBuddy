import SwiftUI

final class PickMeViewViewModel: ObservableObject {
    @Published var isResultAlertPresented = false
    @Published var alpha: CGFloat = 1
    @Published var pickMe = PickMe(
        target: Float(Int.random(in: 1...100)),
        sliderValue: Float(Int.random(in: 1...100)),
        result: 0
    )
    
    func updateAlpha() {
        alpha = CGFloat((100 - abs(pickMe.target - pickMe.sliderValue)) / 100)
    }
    
    func didTapCheckButton() {
        pickMe.result = Int(100 - abs(pickMe.target - pickMe.sliderValue))
        isResultAlertPresented.toggle()
    }
    
    func didTapRestartButton() {
        pickMe.target = Float(Int.random(in: 1...100))
        pickMe.sliderValue = Float(Int.random(in: 1...100))
        updateAlpha()
    }
}
