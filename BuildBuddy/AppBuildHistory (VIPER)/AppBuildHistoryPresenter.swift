protocol AppBuildHistoryPresenterProtocol: AnyObject {
    var viewController: AppBuildHistoryViewProtocol? { get set }
    var interactor: AppBuildHistoryInteractorProtocol! { get set }
    func presentAppBuildHistory(data: AppBuildHistoryModel)
    func viewDidLoad()
}

final class AppBuildHistoryPresenter: AppBuildHistoryPresenterProtocol {
    
    weak var viewController: AppBuildHistoryViewProtocol?
    var interactor: AppBuildHistoryInteractorProtocol!
    var app: AppsCollectionModel?
    
    func viewDidLoad() {
        interactor.fetchAppBuildHistory()
    }
    
    func presentAppBuildHistory(data: AppBuildHistoryModel) {
        if let viewController = viewController {
            viewController.displayAppBuildHistory(data: data)
            print("VC IS NOT NIL")
        } else {
            print("VC IS NIL")
        }
    }
}
