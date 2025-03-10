//
//  HomeScreen.swift
//  Wallify
//
//  Created by HKinfoway Tech. on 10/03/25.
//


import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Featured Wallpapers - Parallax Effect
                FeaturedWallpapersView()
                    .padding(.top, 20)
                
                // Trending Now - Dynamic Grid
                SectionTitle(title: "🔥 Trending Now")
                TrendingWallpapersGrid()
                
                // New Arrivals - Masonry Grid
                SectionTitle(title: "🌟 New Arrivals")
                NewArrivalsMasonryGrid()
                
                // Editor's Picks - Horizontal Scroll
                SectionTitle(title: "🚀 Editor’s Picks")
                EditorsPicksScroll()
                
                // Auto-Change Wallpapers - Full-Width Card
                AutoChangeWallpaperCard()
                    .padding()
                
                // Categories Shortcut
                SectionTitle(title: "📂 Categories")
                CategoriesShortcutView()
                
                // User Submissions (Optional)
                SectionTitle(title: "👤 User Submissions")
                UserSubmissionsGrid()
                
                // Explore More Button
                ExploreMoreButton()
            }
            .padding(.horizontal)
        }
        .background(ThemeColors.background)
    }
}

// MARK: - Section Title
struct SectionTitle: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title2.bold())
            .foregroundColor(ThemeColors.text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 10)
    }
}

// MARK: - Explore More Button
struct ExploreMoreButton: View {
    var body: some View {
        Button(action: {}) {
            Text("🔍 Explore More")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [ThemeColors.primary, ThemeColors.secondary]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(12)
                .shadow(radius: 5)
        }
        .padding(.vertical)
    }
}

// Placeholder views for sections (Replace with actual implementations)



#Preview {
    HomeScreen()
}


// Demo Wallpaper Data Structure
struct Wallpaper: Identifiable {
    let id = UUID()
    let imageName: String
}

// Sample Data
let sampleWallpapers: [Wallpaper] = [
    Wallpaper(imageName: "wallpaper1"),
    Wallpaper(imageName: "wallpaper2"),
    Wallpaper(imageName: "wallpaper3"),
    Wallpaper(imageName: "wallpaper4"),
    Wallpaper(imageName: "wallpaper5"),
    Wallpaper(imageName: "wallpaper6"),
    Wallpaper(imageName: "wallpaper7"),
    Wallpaper(imageName: "wallpaper8")
]

// Placeholder Views with Demo Data
struct FeaturedWallpapersView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(sampleWallpapers) { wallpaper in
                    Image(wallpaper.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 300)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
            }
            .padding()
        }
    }
}

struct TrendingWallpapersGrid: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(sampleWallpapers) { wallpaper in
                Image(wallpaper.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .cornerRadius(10)
                    .shadow(radius: 3)
            }
        }
        .padding()
    }
}

struct NewArrivalsMasonryGrid: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(sampleWallpapers) { wallpaper in
                    Image(wallpaper.imageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
            }
            .padding()
        }
    }
}

struct EditorsPicksScroll: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(sampleWallpapers) { wallpaper in
                    Image(wallpaper.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 250)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.blue, lineWidth: 2))
                }
            }
            .padding()
        }
    }
}

struct AutoChangeWallpaperCard: View {
    @State private var isAutoChangeEnabled = false
    
    var body: some View {
        HStack {
            Text("Auto Wallpaper Change")
                .font(.headline)
            Spacer()
            Toggle("", isOn: $isAutoChangeEnabled)
                .labelsHidden()
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding()
    }
}

struct CategoriesShortcutView: View {
    let categories = ["Nature", "Cyberpunk", "Minimal", "Abstract", "Anime", "Space"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(categories, id: \.self) { category in
                    VStack {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 60, height: 60)
                        Text(category)
                            .font(.caption)
                            .foregroundColor(.primary)
                    }
                }
            }
            .padding()
        }
    }
}

struct UserSubmissionsGrid: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(sampleWallpapers) { wallpaper in
                Image(wallpaper.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150)
                    .cornerRadius(10)
                    .shadow(radius: 2)
            }
        }
        .padding()
    }
}
