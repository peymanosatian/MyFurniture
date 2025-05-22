import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 20) {

            // MARK: - Logo & Tagline (Top with 50 padding)
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
            TextField("Email", text: $email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.green))
                .padding(.horizontal)

            // MARK: - Password Input
            HStack {
                SecureField("Enter your password", text: $password)
                Image(systemName: "eye")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)

            // MARK: - Forgot Password
            HStack {
                Spacer()
                Text("Forgot Password?")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            // Add spacing here
            Spacer().frame(height: 10)

            Button(action: {
                // No login logic for now
            }) {
                Text("Sign In")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(25)
            }
            .padding(.horizontal)


            // MARK: - Sign Up Prompt
            HStack(spacing: 4) {
                Text("Don’t have an account?")
                Text("Sign Up")
                    .foregroundColor(.pink)
            }
            .padding(.top, 10)
            .padding(.bottom, 80)

            // MARK: - Social Buttons
            VStack(spacing: 16) { // increased spacing here
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

            Spacer()
        }
    }
}

#Preview {
    SignInView()
}
