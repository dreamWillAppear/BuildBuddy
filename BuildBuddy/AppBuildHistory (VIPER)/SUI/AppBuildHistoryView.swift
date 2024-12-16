import SwiftUI

struct AppBuildHistoryView: View {
    let data: AppBuildHistoryModel?
    
    var body: some View {
        VStack{
            if let data = data {
                Text(data.name)
                    .font(.largeTitle)
                Image(data.icon)
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(data.description)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                List(data.builds, id: \.version) { build in
                    HStack {
                        Text(build.releaseDate)
                        Spacer()
                        Text(build.version)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                }
                .listStyle(PlainListStyle())
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct AppBuildHistoryView_previews: PreviewProvider {
    static var previews: some View {
        AppBuildHistoryView(
            data:
                AppBuildHistoryModel(
                    name: mockDataAppBuildHistory.name,
                    icon: mockDataAppBuildHistory.icon,
                    description: mockDataAppBuildHistory.description,
                    builds: [
                        BuildVersion(releaseDate: "23.12.2023", version: "7.3.1"),
                        BuildVersion(releaseDate: "14.12.2023", version: "7.3"),
                        BuildVersion(releaseDate: "26.11.2023", version: "7.3")
                    ]
                )
        )
    }
}

