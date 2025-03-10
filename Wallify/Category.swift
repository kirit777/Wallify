//
//  Category.swift
//  Wallify
//
//  Created by HKinfoway Tech. on 10/03/25.
//


import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
}

struct CategoriesScreen: View {
    let categories: [Category] = [
        Category(name: "Abstract", icon: "paintpalette"),
        Category(name: "Minimalist", icon: "circle.grid.3x3.fill"),
        Category(name: "Gradient", icon: "paintbrush"),
        Category(name: "Vintage", icon: "clock"),
        Category(name: "Cyberpunk", icon: "bolt.fill"),
        Category(name: "Mountains", icon: "triangle.fill"),
        Category(name: "Ocean & Beaches", icon: "waveform.path.ecg"),
        Category(name: "Forests & Trees", icon: "leaf.fill"),
        Category(name: "Sunsets", icon: "sun.horizon.fill"),
        Category(name: "Space & Galaxy", icon: "moon.stars.fill"),
        Category(name: "Cars & Bikes", icon: "car.fill"),
        Category(name: "Gaming", icon: "gamecontroller.fill"),
        Category(name: "Anime & Manga", icon: "hare.fill"),
        Category(name: "Superheroes", icon: "star.fill"),
        Category(name: "Luxury", icon: "diamond.fill"),
        Category(name: "Landmarks", icon: "building.columns.fill"),
    ]
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(categories) { category in
                    VStack {
                        Image(systemName: category.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(ThemeColors.primary)
                        Text(category.name)
                            .font(.headline)
                            .foregroundColor(ThemeColors.text)
                    }
                    .padding()
                    .frame(width: 100, height: 120)
                    .background(ThemeColors.secondary.opacity(0.2))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
        .background(ThemeColors.background.ignoresSafeArea())
        .navigationTitle("Categories")
    }
}

struct CategoriesScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesScreen()
    }
}
