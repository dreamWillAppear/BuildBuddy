struct AppBuildHistoryModel {
    let name: String
    let icon: String
    let description: String
    let builds: [BuildVersion]
}

struct BuildVersion {
    let releaseDate: String
    let version: String
}

let mockDataAppBuildHistory = AppBuildHistoryModel(
    name: "Лицо Коллеги",
    icon: "facedStaffIco",
    description: "Корпоративный справочник с ФИО, фото и структурой подразделения сотрудников.",
    builds: [
        BuildVersion(releaseDate: "23.12.2023", version: "7.3.1"),
        BuildVersion(releaseDate: "14.12.2023", version: "7.3"),
        BuildVersion(releaseDate: "26.11.2023", version: "7.3")
    ]
)
