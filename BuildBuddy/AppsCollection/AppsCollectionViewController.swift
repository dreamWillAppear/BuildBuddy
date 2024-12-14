import SwiftUI
//
//Мы используем UIHostingController для отображения SwiftUI View внутри UIKit.
//addChild добавляет UIHostingController как дочерний контроллер, а view.addSubview добавляет его представление.
//

final class AppsCollectionViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let swiftUIView = AppsCollectionView()
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // SwiftUI View как дочерний UIView
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        hostingController.view.frame = view.bounds
    }
}
