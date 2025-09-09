//
//  Gradient+Color.swift
//  Soundscape
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation
import SwiftUI

extension Gradient {
    
    static var purple: Gradient {
        return Gradient(colors: [
            Color(.sRGB, red: 0.182, green: 0.123, blue: 0.796, opacity: 1.0),
            Color(.sRGB, red: 0.443, green: 0.086, blue: 0.792, opacity: 1.0)
        ])
    }
    
    static var blue: Gradient {
        return Gradient(colors: [
            Color(.sRGB, red: 0.03, green: 0.179, blue: 0.562, opacity: 1.0),
            Color(.sRGB, red: 0.246, green: 0.446, blue: 0.746, opacity: 1.0)
        ])
    }
    
    static var darkBlue: Gradient {
        return Gradient(colors: [
            Color(.sRGB, red: 0.026, green: 0.199, blue: 0.371, opacity: 1),
            Color(.sRGB, red: 0.101, green: 0.406, blue: 0.608, opacity: 1)
        ])
    }
    
    static var onboarding: Gradient {
        // Vertical: dark (#011C57) → light (#1147A2) plateau → dark (#011C57)
        return Gradient(stops: [
            // Top: extend dark and smooth into light to hide image/background seam
            .init(color: Color(.sRGB, red: 0.004, green: 0.110, blue: 0.341, opacity: 1.0), location: 0.00), // #011C57
            .init(color: Color(.sRGB, red: 0.067, green: 0.278, blue: 0.635, opacity: 1.0), location: 0.12), // hold dark
            .init(color: Color(.sRGB, red: 0.043, green: 0.224, blue: 0.549, opacity: 1.0), location: 0.22), // mid (#0B398C)
            .init(color: Color(.sRGB, red: 0.067, green: 0.278, blue: 0.635, opacity: 1.0), location: 0.30), // #1147A2
            // Plateau center
            .init(color: Color(.sRGB, red: 0.067, green: 0.278, blue: 0.635, opacity: 1.0), location: 0.70),
            // Bottom: darken again
            .init(color: Color(.sRGB, red: 0.004, green: 0.110, blue: 0.341, opacity: 1.0), location: 1.00)
        ])
    }
    
}
