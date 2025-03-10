import SwiftUI

struct WallpaperPreviewView: View {
    @State private var selectedAspectRatio: AspectRatio = .original
    
    let demoImage = Image("wallpaper1") // Replace with actual wallpaper image
    
    enum AspectRatio: String, CaseIterable {
        case original = "Original"
        case square = "1:1"
        case portrait = "9:16"
        case landscape = "16:9"
    }
    
    var body: some View {
        VStack {
            ZStack {
                demoImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: getWidth(), height: getHeight())
                    .clipped()
                    .overlay(DemoOverlayView()) // Adds clock, icons, status bar
                
                VStack {
                    Spacer()
                    Picker("Aspect Ratio", selection: $selectedAspectRatio) {
                        ForEach(AspectRatio.allCases, id: \..self) { ratio in
                            Text(ratio.rawValue).tag(ratio)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
            }
            
            HStack {
                Button(action: {}) {
                    Text("Download").frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                
                Button(action: {}) {
                    Text("Set Wallpaper").frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                
                Button(action: {}) {
                    Text("Share").frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
        .background(Color.black)
    }
    
    func getWidth() -> CGFloat {
        switch selectedAspectRatio {
        case .original: return UIScreen.main.bounds.width
        case .square: return UIScreen.main.bounds.width * 0.8
        case .portrait: return UIScreen.main.bounds.width * 0.9
        case .landscape: return UIScreen.main.bounds.width
        }
    }
    
    func getHeight() -> CGFloat {
        switch selectedAspectRatio {
        case .original: return UIScreen.main.bounds.height * 0.6
        case .square: return getWidth()
        case .portrait: return UIScreen.main.bounds.height * 0.8
        case .landscape: return UIScreen.main.bounds.height * 0.4
        }
    }
}

struct DemoOverlayView: View {
    var body: some View {
        VStack {
            HStack {
                Text("12:45 PM")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                Spacer()
                HStack(spacing: 10) {
                    Image(systemName: "wifi")
                    Image(systemName: "battery.100")
                }
                .foregroundColor(.white)
                .padding()
            }
            Spacer()
            HStack(spacing: 20) {
                ForEach(0..<4) { _ in
                    Circle()
                        .fill(Color.white.opacity(0.6))
                        .frame(width: 50, height: 50)
                }
            }
            .padding(.bottom, 40)
        }
    }
}

struct WallpaperPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        WallpaperPreviewView()
    }
}
