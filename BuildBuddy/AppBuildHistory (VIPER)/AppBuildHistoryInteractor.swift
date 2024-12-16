protocol AppBuildHistoryInteractorProtocol {
    var presenter: AppBuildHistoryPresenterProtocol? { get set }
    func fetchAppBuildHistory()
}

final class AppBuildHistoryInteractor: AppBuildHistoryInteractorProtocol {
    
    weak var presenter: AppBuildHistoryPresenterProtocol?
    
    func fetchAppBuildHistory() {
        let mockData = mockDataAppBuildHistory
        
        if let presenter = presenter {
            presenter.presentAppBuildHistory(data: mockData)
        }
    }
    
}
