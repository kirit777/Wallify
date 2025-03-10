//
//  CustomeClass.swift
//  Wallify
//
//  Created by HKinfoway Tech. on 10/03/25.
//

import SwiftUI

//struct ThemeColors {
//    static let primary = Color(hex: "#1A1A2E") // Deep Navy
//    static let secondary = Color(hex: "#E94560") // Electric Red
//    static let background = Color(hex: "#0F0F0F") // Pure Black
//    static let text = Color(hex: "#F5F5F5") // Light Gray
//}



struct ThemeColors {
    static let primary = Color(hex: "#1C1C3A") // Midnight Blue
    static let secondary = Color(hex: "#00FFFF") // Electric Cyan
    static let background = Color(hex: "#080808") // Almost Black
    static let text = Color(hex: "#D0D0D0") // Soft White
}





extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: Double
        switch hex.count {
        case 6: // RGB (No alpha)
            (a, r, g, b) = (1, Double((int >> 16) & 0xFF) / 255, Double((int >> 8) & 0xFF) / 255, Double(int & 0xFF) / 255)
        case 8: // ARGB
            (a, r, g, b) = (Double((int >> 24) & 0xFF) / 255, Double((int >> 16) & 0xFF) / 255, Double((int >> 8) & 0xFF) / 255, Double(int & 0xFF) / 255)
        default:
            (a, r, g, b) = (1, 0, 0, 0) // Default to black on error
        }
        
        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}
