//
//  HomeView.swift
//  MyFurniture
//
//  Created by Peyman Osatian on 2025-05-29.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack {
            Text("Welcome to Home!")
                .font(.largeTitle)

            Button("Sign Out") {
                authViewModel.signOut()
            }
            .foregroundColor(.red)
            .padding()
        }
    }
}


#Preview {
    HomeView()
}
