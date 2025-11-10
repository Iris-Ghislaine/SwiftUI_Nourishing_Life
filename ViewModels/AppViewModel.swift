//
//  AppViewModel.swift
//  Nourishing_life_with_us
//
//  Created by Urukundo Monday on 10/11/2025.
//

import SwiftUI

class AppViewModel: ObservableObject {
    @Published var darkMode: Bool = false
    @Published var currentUser: User?
    
    init() {
        darkMode = UserDefaults.standard.bool(forKey: "darkMode")
    }
    
    func toggleDarkMode() {
        darkMode.toggle()
        UserDefaults.standard.set(darkMode, forKey: "darkMode")
    }
}
