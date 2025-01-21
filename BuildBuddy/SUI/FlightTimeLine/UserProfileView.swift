import SwiftUI

struct UserProfileView: View {
    var body: some View {
        ZStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 120, height: 120)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            UserProfileView()
        }
    }
}
