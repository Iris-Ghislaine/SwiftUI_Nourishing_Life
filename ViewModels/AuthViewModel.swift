//
//  AuthViewModel.swift
//  Nourishing_life_with_us
//
//  Created by Urukundo Monday on 10/11/2025.
//

import Foundation

@MainActor
class AuthViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func signIn(email: String, password: String, appVM: AppViewModel) async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            let user = try await FirebaseService.shared.signIn(email: email, password: password)
            appVM.currentUser = user
        } catch {
            errorMessage = "Invalid email or password"
        }
    }
    
    func signUp(name: String, email: String, phone: String, password: String, appVM: AppViewModel) async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            let user = try await FirebaseService.shared.signUp(name: name, email: email, phone: phone, password: password)
            appVM.currentUser = user
        } catch {
            errorMessage = "Failed to create account"
        }
    }
}
