import UIKit

final class AppBuildHistoryModule {
    static func build(for app: AppsCollectionModel) -> UIViewController {
        let viewController = AppBuildHistoryViewController()
        let presenter = AppBuildHistoryPresenter()
        let interactor = AppBuildHistoryInteractor()
        let router = AppBuildHistoryRouter()
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = viewController
        
        
        
        return viewController
    }
}
