import SwiftUI

final class StorageManager {
    @AppStorage("username") var username: String = ""
    
    static let shared = StorageManager()
    
    private init() {}
    
    func setUsername(_ username: String) {
        self.username = username
    }
    
    func removeUsername() {
        username.removeAll()
    }
}
