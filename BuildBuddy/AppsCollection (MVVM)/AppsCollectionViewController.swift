import SwiftUI
//
//Мы используем UIHostingController для отображения SwiftUI View внутри UIKit.
//addChild добавляет UIHostingController как дочерний контроллер, а view.addSubview добавляет его представление.
//
final class AppsCollectionViewController: UIViewController {
    
    let viewModel = AppsCollectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swiftUIView = AppsCollectionView(apps: viewModel.appsStorage) { app in
            self.openAppBuildHistory(for: app)
        }
        
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // SwiftUI View как дочерний UIView
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        hostingController.view.frame = view.bounds
    }
    
    private func openAppBuildHistory(for app: AppsCollectionModel) {
        let appBuildHistoryModule = AppBuildHistoryModule.build(with: app)
        navigationController?.pushViewController(appBuildHistoryModule, animated: true)
    }
}
