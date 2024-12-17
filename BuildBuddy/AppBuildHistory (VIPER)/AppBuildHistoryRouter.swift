protocol AppBuildHistoryRouterProtcol: AnyObject {
    var viewController: AppBuildHistoryViewProtocol? { get set }
}

final class AppBuildHistoryRouter: AppBuildHistoryRouterProtcol {
    weak var viewController: AppBuildHistoryViewProtocol?
}
