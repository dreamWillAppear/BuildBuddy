import SwiftUI

struct TimeLineMainContentView: View {
    var body: some View {
        TabView{
            HomeScreenView()
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Home")
                }
            UserProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
            }
        }
    }
}

struct TimeLineMainContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            TimeLineMainContentView()
        }
    }
}
