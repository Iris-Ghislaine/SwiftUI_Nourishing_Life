//
//  FirebaseService.swift
//  Nourishing_life_with_us
//
//  Created by Urukundo Monday on 10/11/2025.
//

import FirebaseAuth
import FirebaseFirestore

class FirebaseService {
    static let shared = FirebaseService()
    private init() {}
    
    func signIn(email: String, password: String) async throws -> User {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        let fbUser = result.user
        
        let role: UserRole = email.lowercased() == "health@gmail.com" ? .admin : .user
        
        return User(
            id: fbUser.uid,
            email: fbUser.email ?? "",
            name: fbUser.displayName ?? "User",
            role: role,
            phone: nil,
            profileImage: fbUser.photoURL?.absoluteString,
            createdAt: Date()
        )
    }
    
    func signUp(name: String, email: String, phone: String, password: String) async throws -> User {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        
        let changeRequest = result.user.createProfileChangeRequest()
        changeRequest.displayName = name
        try await changeRequest.commitChanges()
        
        return User(
            id: result.user.uid,
            email: email,
            name: name,
            role: .user,
            phone: phone,
            profileImage: nil,
            createdAt: Date()
        )
    }
}
