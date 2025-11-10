//
//  Nourishing_life_with_usApp.swift
//  Nourishing_life_with_us
//
//  Created by Urukundo Monday on 10/11/2025.
//

import SwiftUI

@main
struct Nourishing_life_with_usApp: App {
    @StateObject private var appVM = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if appVM.currentUser != nil {
                    Text("Welcome, \(appVM.currentUser?.name ?? "")!")
                        .font(.largeTitle)
                } else {
                    SignInView(appVM: appVM)
                }
            }
            .environmentObject(appVM)
            .preferredColorScheme(appVM.darkMode ? .dark : .light)
        }
    }
}
