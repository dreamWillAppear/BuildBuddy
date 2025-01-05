import SwiftUI
import Combine

final class LoginViewViewModel: ObservableObject {
    @Published private(set) var user: User
    @Published var isLoggedIn = false
    @Published var username = "" {
        didSet {
            usernameIsValid = username.count >= 3
        }
    }
    
    @Published private(set) var usernameIsValid = false
    
    private var storageManager = StorageManager.shared
    
    init(storageManager: StorageManager = .shared) {
        self.storageManager = storageManager
        self.user = User(
            username: storageManager.username,
            isLoggedIn: !storageManager.username.isEmpty
        )
    }
        
    func didTapLoginButton() {
        guard username.count >= 3 else {
            return
        }
        
        storageManager.username = username
        isLoggedIn = true
    }
    
    func didTapLogoutButton() {
        username.removeAll()
        storageManager.username.removeAll()
        isLoggedIn = false
    }
    
    private func checkLogin() {
        if storageManager.username.count > 0 {
            isLoggedIn = true
        }
    }
    
}

