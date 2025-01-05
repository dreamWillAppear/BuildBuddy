import SwiftUI

final class InitialViewController: UIViewController {
    
    override func viewDidLoad() {
        let swiftUIView = RootView()
        let hostingController = UIHostingController(
            rootView: swiftUIView
                .environmentObject(ContentViewViewModel())
                .environmentObject(LoginViewViewModel())
        )
        
        hostingController.view.frame = view.bounds
        
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
