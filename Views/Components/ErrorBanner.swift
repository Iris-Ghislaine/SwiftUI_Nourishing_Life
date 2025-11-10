//
//  ErrorBanner.swift
//  Nourishing_life_with_us
//
//  Created by Urukundo Monday on 10/11/2025.
//

import SwiftUI

struct ErrorBanner: View {
    let message: String
    
    var body: some View {
        Text(message)
            .font(.caption)
            .foregroundColor(.white)
            .padding()
            .background(Color.red.opacity(0.9))
            .cornerRadius(12)
            .padding(.horizontal)
    }
}
