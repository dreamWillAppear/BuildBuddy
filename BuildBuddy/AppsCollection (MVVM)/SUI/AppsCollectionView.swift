import SwiftUI

struct AppsCollectionView: View {
    
    let apps: [AppsCollectionModel]
    let onAppSelected: (AppsCollectionModel) -> Void
    
    var body: some View {
        ScrollView{
            LazyVGrid (columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 0
            ) {
                ForEach(apps, id: \.id) { app in
                    VStack {
                        Image(app.icon)
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        Text(app.name)
                            .font(.system(size: 10).weight(.bold))
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .onTapGesture {
                        onAppSelected(app)
                    }
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
    }
}

#Preview {
    let mokeData =  [
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
    ]
    
    AppsCollectionView(apps: mokeData, onAppSelected: { _ in})
}
