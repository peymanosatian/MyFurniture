import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationView {
            if authViewModel.isAuthenticated {
                HomeView()
            } else {
                SignInView()
            }
        }
    }
}
