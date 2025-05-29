import SwiftUI
import FirebaseCore

@main
struct MyFurnitureApp: App {
    @StateObject var authViewModel = AuthViewModel()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(authViewModel)
        }
    }
}
