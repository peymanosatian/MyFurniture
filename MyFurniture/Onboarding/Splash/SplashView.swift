//
//  SplashView.swift
//  MyFurniture
//
//  Created by Peyman Osatian on 2025-05-15.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack{
            // Background color
            Color(red: 111/255, green: 150/255, blue: 118/255)
                .ignoresSafeArea()
            VStack{
                Spacer() // Pushes content to the center vertically
                
                HStack(alignment: .center,spacing: 12){
                    Image("couch")
                        .resizable()
                        .frame(width: 48 , height: 48)
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading, spacing: 1){
                        Text("MyFurniture")
                            .font(.custom("Lato-Black", size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Design Your Comfort")
                            .font(.custom("Lato-Thin", size: 16))
                            .foregroundColor(.white.opacity(0.85))
                    }
                }
                Spacer()
                Text("A furniture shopping app")
                    .font(.custom("Lato-Regular", size: 16))
                    .foregroundColor(.white.opacity(0.85))
                    .padding(.bottom, 40)
            }
            .padding()
        }
    }
}

#Preview {
    SplashView()
}
