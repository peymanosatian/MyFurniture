import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false

    // MARK: - Validation Properties
    private var isEmailValid: Bool {
        email.contains("@") && email.contains(".")
    }

    private var isPasswordValid: Bool {
        password.count >= 6
    }

    private var isFormValid: Bool {
        isEmailValid && isPasswordValid
    }

    var body: some View {
        VStack(spacing: 20) {
            // MARK: - Logo & Tagline
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

            // MARK: - Welcome Text
            VStack(spacing: 4) {
                Text("Let’s Sign You In")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Welcome back, you’ve been missed!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.top, 24)

            // MARK: - Email Input
            VStack(alignment: .leading, spacing: 4) {
                TextField("Email", text: $email)
                    .padding()
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(isEmailValid ? Color.green : Color.red))
                    .padding(.horizontal)

                if !isEmailValid && !email.isEmpty {
                    Text("Enter a valid email address")
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                }
            }

            // MARK: - Password Input
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    if showPassword {
                        TextField("Enter your password", text: $password)
                    } else {
                        SecureField("Enter your password", text: $password)
                    }
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                if !isPasswordValid && !password.isEmpty {
                    Text("Password must be at least 6 characters")
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                }
            }

            // MARK: - Forgot Password
            HStack {
                Spacer()
                Text("Forgot Password?")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            // MARK: - Sign In Button
            Button(action: {
                print("Sign in tapped with \(email) / \(password)")
            }) {
                Text("Sign In")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isFormValid ? Color.green : Color.gray)
                    .cornerRadius(25)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .disabled(!isFormValid) // Disable when form is not valid

            // MARK: - Sign Up Prompt
            HStack(spacing: 4) {
                Text("Don’t have an account?")
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .foregroundColor(.pink)
                        .fontWeight(.semibold)
                }
            }
            .padding(.top, 8)

            Spacer()

            // MARK: - Social Buttons
            VStack(spacing: 12) {
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
            .padding(.top, 12)
            .padding(.horizontal)

            Spacer(minLength: 20)
        }
    }
}
#Preview {
    NavigationView {
        SignInView()
    }
}
