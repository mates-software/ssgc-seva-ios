//
//  Colors.swift
//  Soundscape
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import UIKit
import SwiftUI

// MARK: UIKit Color Support

struct Colors {
    struct Foreground {
        static let primary: UIColor? = UIColor(named: "Foreground 1")
        static let primaryLight: UIColor? = UIColor(named: "Foreground 1-Light")
        static let font: UIColor? = UIColor(named: "Font")
    }
    
    struct Background {
        static let primary: UIColor? = UIColor(named: "Background 1")
        static let error: UIColor? = UIColor(named: "Background Error")
        static let menuAlternate: UIColor? = UIColor(named: "Menu Alternate")
    }
    
    struct Highlight {
        static let purple: UIColor? = UIColor(named: "Highlight Purple")
        static let yellow: UIColor? = UIColor(named: "Highlight Yellow")
        static let green: UIColor? = UIColor(named: "Highlight Green")
    }
}

// MARK: Log Color Support

struct LogColors {
    static let Error = UIColor.red
    static let Warning = UIColor.orange
    static let Info = UIColor.green
    static let Debug = UIColor.lightGray
    static let Verbose = UIColor.white
}

// MARK: SwiftUI Color Support

extension Color {
    static let primaryForeground = Color(Colors.Foreground.primary!)
    static let primaryLightForeground = Color(Colors.Foreground.primaryLight!)
    static let primaryFont = Color(Colors.Foreground.font!)
    static let primaryBackground = Color(Colors.Background.primary!)
    static let errorBackground = Color(Colors.Background.error!)
    static let menuAltBackground = Color(Colors.Background.menuAlternate!)
    
    static let purpleHighlight = Color(Colors.Highlight.purple!)
    static let yellowHighlight = Color(Colors.Highlight.yellow!)
    static let greenHighlight = Color(Colors.Highlight.green!)
}
