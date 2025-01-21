import SwiftUI

struct HomeScreenView: View {
    private let flights = FlightInformation.generateFlights()
    
    private var arrivals: [FlightInformation] {
        flights.filter { $0.direction == .arrival }
    }
    
    private var departures: [FlightInformation] {
        flights.filter { $0.direction == .departure }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .opacity(0.1)
                    .rotationEffect(.degrees(-90))
                
                VStack(alignment: .leading, spacing: 10) {
                    NavigationLink("Arrivals") {
                        FlightBoardView(title: "Arrivals", flights: arrivals)
                    }
                    NavigationLink("Arrivals") {
                        FlightBoardView(title: "Departures", flights: departures)
                    }
                    NavigationLink("Flight Time Line") {
                        TimeLineView(flights: flights)
                    }
                    Spacer()
                }
                .font(.title)
                .padding()
            }
            .navigationTitle("Airport")
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            HomeScreenView()
        }
    }
}
