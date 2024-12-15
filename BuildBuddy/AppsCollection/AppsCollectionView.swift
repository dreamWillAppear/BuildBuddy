import SwiftUI

struct AppsCollectionView: View {
    
    let apps: [AppsCollectionModel]
    
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
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        Text(app.name)
                            .font(.system(size: 10))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
    }
}



struct AppsCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        AppsCollectionView(apps:[
            AppsCollectionModel(id: UUID(), name: "Лицо Коллеги", icon: "facedStaffIco"),
            AppsCollectionModel(id: UUID(), name: "Банк Чат", icon: "bankChatIco"),
            AppsCollectionModel(id: UUID(), name: "Банк Почта", icon: "bankMailIco"),
            AppsCollectionModel(id: UUID(), name: "Контракторы", icon: "contractorsIco"),
            AppsCollectionModel(id: UUID(), name: "Сфера", icon: "sphereIco"),
            AppsCollectionModel(id: UUID(), name: "Лицо Коллеги", icon: "facedStaffIco"),
            AppsCollectionModel(id: UUID(), name: "Банк Чат", icon: "bankChatIco"),
            AppsCollectionModel(id: UUID(), name: "Автоматизация Задач", icon: "bankMailIco"),
            AppsCollectionModel(id: UUID(), name: "Контракторы", icon: "contractorsIco"),
            AppsCollectionModel(id: UUID(), name: "Сфера", icon: "sphereIco"),
            AppsCollectionModel(id: UUID(), name: "Лицо Коллеги", icon: "facedStaffIco"),
            AppsCollectionModel(id: UUID(), name: "Банк Чат", icon: "bankChatIco"),
            AppsCollectionModel(id: UUID(), name: "Банк Почта", icon: "bankMailIco"),
            AppsCollectionModel(id: UUID(), name: "Контракторы", icon: "contractorsIco"),
            AppsCollectionModel(id: UUID(), name: "Сфера", icon: "sphereIco"),
            AppsCollectionModel(id: UUID(), name: "Лицо Коллеги", icon: "facedStaffIco"),
            AppsCollectionModel(id: UUID(), name: "Банк Чат", icon: "bankChatIco"),
            AppsCollectionModel(id: UUID(), name: "Банк Почта", icon: "bankMailIco"),
            AppsCollectionModel(id: UUID(), name: "Контракторы", icon: "contractorsIco"),
            AppsCollectionModel(id: UUID(), name: "Сфера", icon: "sphereIco")
        ])
    }
}
