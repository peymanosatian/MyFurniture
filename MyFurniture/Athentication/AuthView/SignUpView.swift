import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false

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
            TextField("Email", text: $email)
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)

            // MARK: - Username Field
            TextField("Username", text: $username)
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)

            // MARK: - Password Field
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
            .padding(.horizontal)
            .frame(height: 50)
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)

            // MARK: - Sign Up Button
            Button(action: {
                // Sign up logic here
            }) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(25)
            }
            .padding(.horizontal)
            .padding(.top, 10)

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
    }
}
