import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            OnboardingView()
        } else {
            ZStack {
                Color(red: 111 / 255, green: 150 / 255, blue: 118 / 255)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    // Logo + Text
                    HStack(alignment: .center, spacing: 12) {
                        Image("couch")
                            .resizable()
                            .frame(width: 46, height: 46)
                            .foregroundColor(.white)
                        
                        VStack(alignment: .leading, spacing: 1) {
                            Text("MyFurniture")
                                .font(.custom("Lato-Bold", size: 22))
                                .foregroundColor(.white)
                            
                            Text("Design Your Comfort")
                                .font(.custom("Lato-Regular", size: 14))
                                .foregroundColor(.white.opacity(0.85))
                        }
                    }
                    
                    Spacer()
                    
                    Text("A Furniture Shopping App")
                        .font(.custom("Lato-Light", size: 14))
                        .foregroundColor(.white.opacity(0.85))
                        .padding(.bottom, 40)
                }
                .padding()
            }
            // ✅ Run timer on appear, inside the view hierarchy
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    isActive = true
                }
            }
        }
    }
}
