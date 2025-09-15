//
//  UIColor+Theme.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation

extension UIColor {
    
    enum Theme {
        
        // MARK: Main
        static let yellow = UIColor(hex: "#FFBA00")
        static let teal = UIColor(hex: "#008575")
        static let blue = UIColor(hex: "#0078D4")
        
        // Dark
        static let darkYellow = UIColor(hex: "#6B4A17")
        static let darkTeal = UIColor(hex: "#264A47")
        static let darkBlue = UIColor(hex: "#164792")
        
        // Light
        static let lightYellow = UIColor(hex: "#FFF000")
        static let lightTeal = UIColor(hex: "#30E6D1")
        static let lightBlue = UIColor(hex: "#4FE6FF")
        
        // MARK: Neutrals
        static let extraLightGray = UIColor(hex: "#F2F2F2")
        static let lightGray = UIColor(hex: "#E5E5E5")
        static let gray = UIColor(hex: "#D1D1D1")
        static let midGray = UIColor(hex: "#737373")
        static let darkGray = UIColor(hex: "#4F4F4F")
        static let extraDarkGray = UIColor(hex: "#2E2E2E")
        
    }
}


extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
