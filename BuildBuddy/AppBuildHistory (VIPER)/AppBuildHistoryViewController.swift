import SwiftUI

protocol AppBuildHistoryViewProtocol: AnyObject {
    var presenter: AppBuildHistoryPresenterProtocol! { get set }
    func displayAppBuildHistory(data: AppBuildHistoryModel)
}

final class AppBuildHistoryViewController: UIViewController, AppBuildHistoryViewProtocol {
    
    var presenter: AppBuildHistoryPresenterProtocol!
    
    private var hostingController: UIHostingController<AppBuildHistoryView>?
    
    override func viewDidLoad() {
        let swiftUIView = AppBuildHistoryView(data: nil)
        let hostingController = UIHostingController(rootView: swiftUIView)
    
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        hostingController.view.frame = view.bounds
        
        self.hostingController = hostingController
    }
    
    func displayAppBuildHistory(data: AppBuildHistoryModel) {
        hostingController?.rootView = AppBuildHistoryView(data: data)
    }
}
