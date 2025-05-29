import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false

    private var isEmailValid: Bool {
        email.contains("@") && email.contains(".")
    }

    private var isUsernameValid: Bool {
        !username.trimmingCharacters(in: .whitespaces).isEmpty
    }

    private var isPasswordValid: Bool {
        password.count >= 6
    }

    private var isFormValid: Bool {
        isEmailValid && isUsernameValid && isPasswordValid
    }

    var body: some View {
        VStack(spacing: 20) {
            // MARK: - Logo
            VStack(spacing: 8) {
                HStack {
                    Image("couchGreen")
                        .resizable()
                        .frame(width: 40, height: 40)

                    VStack(alignment: .leading, spacing: 2) {
                        Text("My Furniture")
                            .font(.custom("Lato-Bold", size: 20))
                        Text("Design Your Comfort")
                            .font(.custom("Lato-Regular", size: 14))
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.top, 50)

            // MARK: - Title
            VStack(spacing: 4) {
                Text("Getting Started")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Create an account to continue!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.top, 24)

            // MARK: - Email Field
            VStack(alignment: .leading, spacing: 4) {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isEmailValid || email.isEmpty ? Color.clear : Color.red)
                    )

                if !isEmailValid && !email.isEmpty {
                    Text("Enter a valid email address")
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                }
            }

            // MARK: - Username Field
            VStack(alignment: .leading, spacing: 4) {
                TextField("Username", text: $username)
                    .autocapitalization(.none)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isUsernameValid || username.isEmpty ? Color.clear : Color.red)
                    )

                if !isUsernameValid && !username.isEmpty {
                    Text("Username cannot be empty")
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                }
            }

            // MARK: - Password Field
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    if showPassword {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                }
                .autocapitalization(.none)
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isPasswordValid || password.isEmpty ? Color.clear : Color.red)
                )

                if !isPasswordValid && !password.isEmpty {
                    Text("Password must be at least 6 characters")
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                }
            }

            // MARK: - Error Message (if any)
            if let error = authViewModel.errorMessage {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }

            // MARK: - Sign Up Button
            Button(action: {
                authViewModel.signUp(email: email, password: password)
            }) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isFormValid ? Color.green : Color.gray)
                    .cornerRadius(25)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .disabled(!isFormValid)

            // MARK: - Already have account
            HStack(spacing: 4) {
                Text("Already have an account?")
                NavigationLink(destination: SignInView()) {
                    Text("Sign In")
                        .foregroundColor(.green)
                        .fontWeight(.semibold)
                }
            }
            .padding(.top, 10)

            Spacer()

            // MARK: - Social Buttons
            VStack(spacing: 16) {
                HStack {
                    Image(systemName: "f.square.fill")
                    Text("Continue With Facebook")
                        .fontWeight(.medium)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(15)

                HStack {
                    Image(systemName: "g.circle")
                    Text("Continue With Google")
                        .fontWeight(.medium)
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
            }
            .padding(.horizontal)
            .padding(.top, 32)

            Spacer()
        }
    }
}

#Preview {
    NavigationView {
        SignUpView()
            .environmentObject(AuthViewModel())
    }
}
