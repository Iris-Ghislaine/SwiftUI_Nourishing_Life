// Views/Auth/SignInView.swift
import SwiftUI

struct SignInView: View {
    @ObservedObject var appVM: AppViewModel
    @StateObject private var authVM = AuthViewModel()
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            AuthBackground(appVM: appVM)
            
            VStack(spacing: 24) {
                VStack(spacing: 8) {
                    Text("Welcome Back")
                        .font(.largeTitle).bold()
                        .foregroundColor(.primary)
                    
                    Text("Sign in to access your health meal plans")
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 40)
                
                if let error = authVM.errorMessage {
                    ErrorBanner(message: error)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
                
                VStack(spacing: 16) {
                    TextFieldWithIcon(icon: "envelope", placeholder: "your@email.com", text: $email)
                    TextFieldWithIcon(icon: "lock", placeholder: "••••••••", text: $password, isSecure: true)
                }
                .padding(.horizontal)
                
                GradientButton(title: "Sign In", icon: "arrow.right") {
                    Task {
                        await authVM.signIn(email: email, password: password, appVM: appVM)
                    }
                }
                
                NavigationLink("Don't have an account? Sign Up", destination: SignUpView(appVM: appVM))
                    .foregroundColor(.green)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Demo Accounts:").font(.headline).fontWeight(.medium)
                    Text("Admin: health@gmail.com / admin")
                    Text("User: user@example.com / user")
                }
                .font(.caption)
                .padding()
                .background(Color(.systemGray6).opacity(0.6))
                .cornerRadius(16)
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}


#Preview("Light Mode") {
    NavigationStack {
        SignInView(appVM: AppViewModel())
            .preferredColorScheme(.light)
    }
}

#Preview("Dark Mode") {
    NavigationStack {
        SignInView(appVM: AppViewModel())
            .environment(\.colorScheme, .dark)
    }
}

#Preview("Dark Mode Enabled in App") {
    NavigationStack {
        let appVM = AppViewModel()
        appVM.darkMode = true
        return SignInView(appVM: appVM)
    }
}
