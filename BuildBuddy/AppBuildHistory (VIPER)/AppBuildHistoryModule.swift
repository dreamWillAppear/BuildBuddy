import UIKit

final class AppBuildHistoryModule {
    static func build(with app: AppsCollectionModel) -> UIViewController {
        let viewController = AppBuildHistoryViewController()
        let presenter = AppBuildHistoryPresenter()
        let interactor = AppBuildHistoryInteractor()
        let router = AppBuildHistoryRouter()

        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.interactor = interactor
      //  presenter.router = router
        interactor.presenter = presenter
        router.viewController = viewController
        
        presenter.app = app

        return viewController
    }
}
