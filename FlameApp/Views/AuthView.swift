import SwiftUI

struct AuthView: View {
    @Binding var isAuthenticated: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var isShowingSignUp = false
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            VStack(spacing: 20) {
                Image(systemName: "flame.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.orange)
                
                Text("Flame")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    authenticateUser()
                }) {
                    Text(isShowingSignUp ? "Sign Up" : "Sign In")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    isShowingSignUp.toggle()
                }) {
                    Text(isShowingSignUp ? "Already have an account? Sign In" : "Don't have an account? Sign Up")
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
        .background(Color(.systemBackground))
    }
    
    private func authenticateUser() {
        withAnimation {
            isAuthenticated = true
        }
    }
}

#Preview {
    AuthView(isAuthenticated: .constant(false))
}