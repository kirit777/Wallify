//
//  OnboardingScreen.swift
//  Wallify
//
//  Created by HKinfoway Tech. on 10/03/25.
//


import SwiftUI

struct OnboardingScreen: View {
    @State private var currentIndex = 0
    @State private var animate = false
    
    let pages = [
        ("Welcome to Wallify!", "Easily find and set the best wallpapers!", "paintbrush.fill"),
        ("Explore Endless Choices", "Browse a massive collection of stunning wallpapers!", "photo.fill"),
        ("Set with One Tap", "Apply wallpapers instantly to your home and lock screen!", "hand.tap.fill")
    ]
    
    var body: some View {
        ZStack {
            ThemeColors.background.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                TabView(selection: $currentIndex) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        VStack(spacing: 20) {
                            Image(systemName: pages[index].2)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(ThemeColors.primary)
                                .scaleEffect(animate ? 1.1 : 1.0)
                                .rotationEffect(.degrees(animate ? 10 : -10))
                                .animation(Animation.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: animate)
                            
                            Text(pages[index].0)
                                .font(.title)
                                .bold()
                                .foregroundColor(ThemeColors.text)
                                .transition(.opacity)
                            
                            Text(pages[index].1)
                                .font(.body)
                                .foregroundColor(ThemeColors.text.opacity(0.8))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                                .transition(.opacity)
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .onAppear { animate.toggle() }
                
                Spacer()
                
                Button(action: {
                    if currentIndex < pages.count - 1 {
                        currentIndex += 1
                    }
                }) {
                    Text(currentIndex == pages.count - 1 ? "Get Started" : "Next")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(ThemeColors.primary)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    OnboardingScreen()
}
