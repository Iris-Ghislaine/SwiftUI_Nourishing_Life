//
//  AuthBackground.swift
//  Nourishing_life_with_us
//
//  Created by Urukundo Monday on 10/11/2025.
//

import SwiftUI

struct AuthBackground: View {
    @ObservedObject var appVM: AppViewModel
    
    var body: some View {
        ZStack {
            if appVM.darkMode {
                Color.gray.opacity(0.95)
            } else {
                LinearGradient(
                    colors: [Color.green.opacity(0.1), Color.teal.opacity(0.2)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        }
        .ignoresSafeArea()
    }
}
