import SwiftUI
import Combine

final class LoginViewViewModel: ObservableObject {
    @Published private(set) var user: User
    @Published private(set) var usernameIsValid = false
    @Published var username = "" {
        didSet {
            usernameIsValid = username.count >= 3
        }
    }
    
    private var storageManager = StorageManager.shared
    
    init(storageManager: StorageManager = .shared) {
        self.storageManager = storageManager
        let savedUsername = storageManager.username
        self.user = User(
            username: savedUsername,
            isLoggedIn: !savedUsername.isEmpty
        )
        self.username = savedUsername
        self.usernameIsValid = savedUsername.count >= 3
    }
    
    func didTapLoginButton() {
        guard usernameIsValid else { return }
        user.username = username
        user.isLoggedIn = true
        storageManager.username = username
    }
    
    func didTapLogoutButton() {
        username.removeAll()
        storageManager.username.removeAll()
        user.isLoggedIn = false
    }
}
