//
//  AuthViewModel.swift
//  MyFurniture
//
//  Created by Peyman Osatian on 2025-05-29.
//
import Foundation
import FirebaseAuth
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var isAuthenticated = false
    @Published var errorMessage: String?

    init() {
        self.user = Auth.auth().currentUser
        self.isAuthenticated = user != nil
    }

    func signUp(email: String, password: String) {
        errorMessage = nil
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                self.user = result?.user
                self.isAuthenticated = true
            }
        }
    }

    func signIn(email: String, password: String) {
        errorMessage = nil
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                self.user = result?.user
                self.isAuthenticated = true
            }
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        self.user = nil
        self.isAuthenticated = false
    }
}

