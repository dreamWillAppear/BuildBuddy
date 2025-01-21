import SwiftUI

struct PickMeView: View {
    @EnvironmentObject private var pickMeViewVM: PickMeViewViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            Text("Move the Slider as close to \(pickMeViewVM.pickMe.target.formatted()) as you can" )
         
            HStack {
                Text("1")
                UISliderRepresentation(
                    sliderValue: $pickMeViewVM.pickMe.sliderValue,
                    alpha: pickMeViewVM.alpha,
                    onValueChanged: { pickMeViewVM.updateAlpha() }
                )
                Text("100")
            }
            
            Button("Check Me!", action: {
                pickMeViewVM.didTapCheckButton()
            })
            
            Button("Restart", action: { pickMeViewVM.didTapRestartButton() })
        }
        .padding(.all, 16)
        .alert(
            "Result",
            isPresented: $pickMeViewVM.isResultAlertPresented,
            actions: {
            }) {
            Text("Your Score: \(pickMeViewVM.pickMe.result)")
        }
    }
}

struct PickMeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            PickMeView()
                .environmentObject(PickMeViewViewModel())
        }
    }
}
