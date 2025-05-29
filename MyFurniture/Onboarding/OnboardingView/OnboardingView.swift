import SwiftUI

struct OnboardingView: View {
    @State private var currentIndex = 0
    @State private var goToSignIn = false

    private let slides = [
        OnboardingSlide(imageName: "Slide1", title: "Choose the furniture you love", description: "Find your perfect fit easily"),
        OnboardingSlide(imageName: "Slide2", title: "Style your home effortlessly", description: "Modern, cozy, or classic? Yours."),
        OnboardingSlide(imageName: "Slide3", title: "Comfort meets elegant design", description: "Feel at home every day.")
    ]

    var body: some View {
        NavigationStack {
            VStack {
                // Top logo
                HStack(spacing: 4) {
                    Image("couchGreen")
                        .resizable()
                        .frame(width: 46, height: 46)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("My Furniture")
                            .font(.custom("Lato-Bold", size: 20))
                        Text("Design Your Comfort")
                            .font(.custom("Lato-Regular", size: 14))
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 8)
                }
                .padding(.top, 50)

                Spacer()

                // Slides
                TabView(selection: $currentIndex) {
                    ForEach(Array(slides.enumerated()), id: \.offset) { index, slide in
                        VStack(spacing: 20) {
                            Image(slide.imageName)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                                .padding(.horizontal, 20)

                            Text(slide.title)
                                .font(.custom("Lato-Bold", size: 22))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)

                            Text(slide.description)
                                .font(.custom("Lato-Regular", size: 14))
                                .foregroundColor(.gray)
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 400)

                // Dot indicator
                HStack(spacing: 8) {
                    ForEach(0..<slides.count, id: \.self) { index in
                        Capsule()
                            .fill(index == currentIndex ? Color(red: 111/255, green: 150/255, blue: 118/255) : Color.gray.opacity(0.3))
                            .frame(width: index == currentIndex ? 24 : 8, height: 8)
                            .animation(.easeInOut, value: currentIndex)
                    }
                }
                .padding(.top, 10)

                Spacer()

                // Navigation Buttons
                HStack {
                    NavigationLink(destination: SignInView()) {
                        Text("Skip")
                            .foregroundColor(.gray)
                            .font(.custom("Lato-Italic", size: 18))
                    }

                    Spacer()

                    Button(action: {
                        if currentIndex < slides.count - 1 {
                            currentIndex += 1
                        } else {
                            goToSignIn = true
                        }
                    }) {
                        Text(currentIndex == slides.count - 1 ? "Start" : "Next")
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .background(Color(red: 111/255, green: 150/255, blue: 118/255))
                            .cornerRadius(30)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)

                // Hidden programmatic navigation
                NavigationLink(destination: SignInView(), isActive: $goToSignIn) {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
