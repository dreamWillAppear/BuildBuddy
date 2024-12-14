import Foundation

class AppsCollectionViewModel {
    
    private(set) var appsStorage: [AppsCollectionModel] = []
    
    func fetchApps() {
        self.appsStorage = [
            AppsCollectionModel(id: UUID(), name: "Лицо Коллеги", icon: "facedStaffIco"),
            AppsCollectionModel(id: UUID(), name: "Банк Чат", icon: "bankChatIco"),
            AppsCollectionModel(id: UUID(), name: "Банк Почта", icon: "bankMailIco"),
            AppsCollectionModel(id: UUID(), name: "Контракторы", icon: "contractorsIco"),
            AppsCollectionModel(id: UUID(), name: "Сфера", icon: "sphereIco")
        ]
    }
    
}
