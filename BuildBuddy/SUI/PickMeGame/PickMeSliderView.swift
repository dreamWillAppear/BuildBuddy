import SwiftUI

struct PickMeSliderView: View {
    @Binding var sliderValue: Double
    let range: ClosedRange<Double>
    
    var body: some View {
        HStack(spacing: 25) {
            Text(range.lowerBound.formatted())
            Slider(
                value: $sliderValue,
                in: range,
                step: 1)
            Text(range.upperBound.formatted())
        }
    }
}

