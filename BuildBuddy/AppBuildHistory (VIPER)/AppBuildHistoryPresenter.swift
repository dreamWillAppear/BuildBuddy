protocol AppBuildHistoryPresenterProtocol: AnyObject {
    var viewController: AppBuildHistoryViewProtocol? { get set }
    var interactor: AppBuildHistoryInteractorProtocol! { get set }
    func presentAppBuildHistory(data: AppBuildHistoryModel)
}

final class AppBuildHistoryPresenter: AppBuildHistoryPresenterProtocol {
    
    weak var viewController: AppBuildHistoryViewProtocol?
    var interactor: AppBuildHistoryInteractorProtocol!
    
    func presentAppBuildHistory(data: AppBuildHistoryModel) {
        viewController?.displayAppBuildHistory(data: data)
    }
}
