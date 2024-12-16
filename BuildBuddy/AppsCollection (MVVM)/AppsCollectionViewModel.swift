import Foundation

class AppsCollectionViewModel {
    
    private(set) var appsStorage: [AppsCollectionModel] = []
    
    init() {
        fetchApps()
    }
    
    func fetchApps() {
        self.appsStorage = [
            AppsCollectionModel(id: UUID(), name: "Лицо Коллеги", icon: "facedStaffIco"),
            AppsCollectionModel(id: UUID(), name: "Банк Чат", icon: "bankChatIco"),
            AppsCollectionModel(id: UUID(), name: "Банк Почта", icon: "bankMailIco"),
            AppsCollectionModel(id: UUID(), name: "Контракторы", icon: "contractorsIco"),
            AppsCollectionModel(id: UUID(), name: "Сфера", icon: "sphereIco"),
            AppsCollectionModel(id: UUID(), name: "CRM Комета", icon: "crmCometIco"),
            AppsCollectionModel(id: UUID(), name: "HR Космос", icon: "hrCosmosIco"),
            AppsCollectionModel(id: UUID(), name: "Реестр Договоров", icon: "contractRegistryIco"),
            AppsCollectionModel(id: UUID(), name: "Финансовый Анализ", icon: "financeAnalysisIco"),
            AppsCollectionModel(id: UUID(), name: "Контроль Складов", icon: "warehouseControlIco"),
            AppsCollectionModel(id: UUID(), name: "Центр Управления", icon: "controlCenterIco"),
            AppsCollectionModel(id: UUID(), name: "Аналитика Отделов", icon: "departmentsAnalyticsIco"),
            AppsCollectionModel(id: UUID(), name: "Бюджет Проектов", icon: "projectBudgetIco"),
            AppsCollectionModel(id: UUID(), name: "Управление Рисками", icon: "riskManagementIco"),
            AppsCollectionModel(id: UUID(), name: "Кадровый Учет", icon: "personnelAccountingIco"),
            AppsCollectionModel(id: UUID(), name: "Цифровой Архив", icon: "digitalArchiveIco"),
            AppsCollectionModel(id: UUID(), name: "Автоматизация Задач", icon: "taskAutomationIco"),
            AppsCollectionModel(id: UUID(), name: "Платформа Платежей", icon: "paymentPlatformIco"),
            AppsCollectionModel(id: UUID(), name: "Система Отчетов", icon: "reportingSystemIco"),
            AppsCollectionModel(id: UUID(), name: "Резерв Финансов", icon: "financialReserveIco"),
            AppsCollectionModel(id: UUID(), name: "Мониторинг Рынка", icon: "marketMonitoringIco"),
            AppsCollectionModel(id: UUID(), name: "Банк Аналитика", icon: "bankAnalyticsIco"),
            AppsCollectionModel(id: UUID(), name: "Финансы Группы", icon: "groupFinanceIco"),
            AppsCollectionModel(id: UUID(), name: "Контроль Задач", icon: "taskControlIco"),
            AppsCollectionModel(id: UUID(), name: "Платежный Шлюз", icon: "paymentGatewayIco")
        ]
    }
    
}
