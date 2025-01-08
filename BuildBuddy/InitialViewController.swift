import SwiftUI

final class InitialViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Bundle.main.paths(forResourcesOfType: "nib", inDirectory: nil))
        let hostingController = UIHostingController(
            rootView: PickMeView()
                .environmentObject(PickMeViewViewModel())
        )
        
        hostingController.view.frame = view.bounds
        
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
