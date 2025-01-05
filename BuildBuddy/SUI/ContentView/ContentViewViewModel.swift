import Foundation
import Combine

final class ContentViewViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var counter = 3
    var buttonTitile = "Start"
    
    private var timer: Timer?
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        
        didTapButton()
    }
        
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitile = "Reset"
        }
        
        objectWillChange.send()
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func didTapButton() {
        if buttonTitile == "Reset" {
            counter = 3
            buttonTitile = "Start"
        } else {
            buttonTitile = "Wait..."
        }
        
        objectWillChange.send()
    }
    
}
