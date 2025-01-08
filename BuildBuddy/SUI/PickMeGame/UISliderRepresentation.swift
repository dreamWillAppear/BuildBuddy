import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var sliderValue: Float
    var alpha: CGFloat
    var onValueChanged: () -> Void
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.thumbTintColor  = .red.withAlphaComponent(alpha)
        slider.value = sliderValue
    
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
        uiView.thumbTintColor = .red.withAlphaComponent(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}

 extension UISliderRepresentation {
    final class Coordinator: NSObject {
        var parent: UISliderRepresentation
        
        init(parent: UISliderRepresentation) {
            self.parent = parent
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            parent.sliderValue = sender.value
            parent.onValueChanged()
        }
    }
}

#Preview(body: {
    UISliderRepresentation(sliderValue: .constant(30), alpha: 0.3, onValueChanged: {})
})
