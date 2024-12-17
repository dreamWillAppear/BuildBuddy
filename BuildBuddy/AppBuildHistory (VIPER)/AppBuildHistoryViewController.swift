import SwiftUI

protocol AppBuildHistoryViewProtocol: AnyObject {
    var presenter: AppBuildHistoryPresenterProtocol! { get set }
    func displayAppBuildHistory(data: AppBuildHistoryModel)
}

final class AppBuildHistoryViewController: UIViewController, AppBuildHistoryViewProtocol {
    
    var presenter: AppBuildHistoryPresenterProtocol!
    
    private var hostingController: UIHostingController<AppBuildHistoryView>?
    private var appBuildHistoryData: AppBuildHistoryModel? = nil {
        didSet {
            hostingController?.rootView = AppBuildHistoryView(data: .constant(appBuildHistoryData))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        let swiftUIView = AppBuildHistoryView(data: .constant(appBuildHistoryData))
        let hostingController = UIHostingController(rootView: swiftUIView)
    
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        hostingController.view.frame = view.bounds
        
        self.hostingController = hostingController
    }
    
    func displayAppBuildHistory(data: AppBuildHistoryModel) {
        appBuildHistoryData = data
    }
}
