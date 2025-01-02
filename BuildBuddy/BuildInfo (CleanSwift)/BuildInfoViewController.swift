import SwiftUI

protocol BuildInfoDisplayLogic: AnyObject {
    
}

final class BuildInfoViewController: UIViewController, BuildInfoDisplayLogic {
    override func viewDidLoad() {
        super.viewDidLoad()
        let swiftUIView = ColorPickerView()
        let hostingController = UIHostingController(rootView: swiftUIView)
        hostingController.view.frame = view.bounds
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
    
}
