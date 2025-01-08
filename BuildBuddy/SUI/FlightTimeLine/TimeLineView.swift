import SwiftUI
import TimelineTableViewCell

struct TimeLineView: UIViewControllerRepresentable {
    let flights: [FlightInformation]
    
    func makeUIViewController(context: Context) ->  UITableViewController {
        UITableViewController()
    }
    
    func updateUIViewController(_ uiViewController: UITableViewController, context: Context) {
        let bundle = Bundle(for: TimelineTableViewCell.self)
        let timeLineTableViewCell = UINib(nibName: "TimelineTableViewCell", bundle: bundle)
        
        uiViewController.tableView.register(
            timeLineTableViewCell,
            forCellReuseIdentifier: "TimelineTableViewCell"
        )
        
        uiViewController.tableView.dataSource = context.coordinator
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(flights: flights)
    }
}

extension TimeLineView {
    final class Coordinator: NSObject, UITableViewDataSource {
        let flights: [FlightInformation]
        
        init(flights: [FlightInformation]) {
            self.flights = flights
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            flights.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let dateFormatter = DateFormatter()
                      dateFormatter.timeStyle = .short
                      dateFormatter.dateStyle = .none
                      
                      let flight = flights[indexPath.row]
                      let scheduledString = dateFormatter.string(from: flight.scheduledTime) // Запланированные рейсы
                      let currentString = dateFormatter.string(from: flight.currentTime ?? flight.scheduledTime) // Текущие рейсы
                      
                      let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as? TimelineTableViewCell
                      
                      var flightInfo = "\(flight.airline) \(flight.number) "
                      flightInfo += "\(flight.direction == .departure ? "to" : "from")"
                      flightInfo += " \(flight.otherAirport) - \(flight.flightStatus)"
                      
            cell?.descriptionLabel.text = flightInfo
            cell?.titleLabel.text = "On Time for \(scheduledString)"
                      
                      if flight.status == .cancelled {
                          cell?.titleLabel.text = "Cancelled"
                      } else if flight.timeDifference != 0, flight.status == .cancelled {
                          cell?.titleLabel.text = "Cancelled"
                      } else if flight.timeDifference != 0 {
                          cell?.titleLabel.text = "\(scheduledString)  Now: \(currentString)"
                      }
                      
            cell?.titleLabel.textColor = .black
            cell?.bubbleColor = flight.timelineColor
                      
            return cell ?? UITableViewCell()
        }
    }

}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            TimeLineView(flights: FlightInformation.generateFlights())
        }
    }
}

