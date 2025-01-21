import SwiftUI

struct FlightBoardView: View {
    let title: String
    let flights: [FlightInformation]
    
    var body: some View {
        Text(title)
            .font(.largeTitle)
    }
}

struct FlightBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            FlightBoardView(
                title: "Board Title",
                flights: FlightInformation.generateFlights()
            )
        }
    }
}
