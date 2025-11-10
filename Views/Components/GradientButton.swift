//
//  GradientButton.swift
//  Nourishing_life_with_us
//
//  Created by Urukundo Monday on 10/11/2025.
//

import SwiftUI

struct GradientButton: View {
    let title: String
    let icon: String?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                if let icon = icon {
                    Image(systemName: icon)
                }
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.teal]),
                               startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(16)
            .shadow(radius: 8)
        }
        .padding(.horizontal)
    }
}
