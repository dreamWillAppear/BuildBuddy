import SwiftUI

protocol BuildInfoDisplayLogic: AnyObject {
    
}

final class BuildInfoViewController: UIViewController, BuildInfoDisplayLogic {
    private let contentViewVM = ContentViewViewModel()
    private let loginViewVM = LoginViewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swiftUIView = ContentView()
        let hostingController = UIHostingController(
            rootView: swiftUIView
                .environmentObject(contentViewVM)
                .environmentObject(loginViewVM)
        )
        
        hostingController.view.frame = view.bounds
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
    
}
