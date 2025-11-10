// Views/Auth/SignUpView.swift
import SwiftUI

struct SignUpView: View {
    @ObservedObject var appVM: AppViewModel
    @StateObject private var authVM = AuthViewModel()
    
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            AuthBackground(appVM: appVM)
            
            VStack(spacing: 24) {
                VStack(spacing: 8) {
                    Text("Create Account")
                        .font(.largeTitle).bold()
                        .foregroundColor(.primary)
                    
                    Text("Join us for personalized health meal plans")
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 40)
                
                if let error = authVM.errorMessage {
                    ErrorBanner(message: error)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
                
                VStack(spacing: 16) {
                    TextFieldWithIcon(icon: "person", placeholder: "Full Name", text: $name)
                    TextFieldWithIcon(icon: "envelope", placeholder: "your@email.com", text: $email)
                    TextFieldWithIcon(icon: "phone", placeholder: "+250 78...", text: $phone)
                    TextFieldWithIcon(icon: "lock", placeholder: "Password", text: $password, isSecure: true)
                    TextFieldWithIcon(icon: "lock", placeholder: "Confirm Password", text: $confirmPassword, isSecure: true)
                }
                .padding(.horizontal)
                
                GradientButton(title: "Create Account", icon: "person.badge.plus") {
                    if password != confirmPassword {
                        authVM.errorMessage = "Passwords do not match"
                        return
                    }
                    Task {
                        await authVM.signUp(name: name, email: email, phone: phone, password: password, appVM: appVM)
                    }
                }
                
                NavigationLink("Already have an account? Sign In", destination: SignInView(appVM: appVM))
                    .foregroundColor(.green)
                    .fontWeight(.semibold)
                
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}


#Preview("Light Mode") {
    NavigationStack {
        SignUpView(appVM: AppViewModel())
            .preferredColorScheme(.light)
    }
}

#Preview("Dark Mode") {
    NavigationStack {
        SignUpView(appVM: AppViewModel())
            .preferredColorScheme(.dark)
    }
}

#Preview("Dark Mode + Error") {
    NavigationStack {
        let appVM = AppViewModel()
        appVM.darkMode = true
        return SignUpView(appVM: appVM)
            .onAppear {
                // Simulate error
                Task {
                    try? await Task.sleep(nanoseconds: 500_000_000)
                    // You can trigger error in preview if you want
                }
            }
    }
}
