import SwiftUI


struct SplashScreenView: View {
    var body: some View {
        ZStack {
            // Background color
            ThemeColors.primary
                .ignoresSafeArea()
            
            VStack {
                // Logo
                Image(systemName: "photo.on.rectangle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    
                // App Name
                Text("Wallify")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    
                // Tagline
                Text("Bringing Colors to Your Screen")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(ThemeColors.secondary)
                    .padding(.top, 5)
            }
            .opacity(0.9)
        }
    }
}

#Preview {
    SplashScreenView()
}
