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
    static let fontColor: UIColor? = UIColor(named: "font-primary")
    
    struct Foreground {
        static let primary: UIColor? = UIColor(named: "foreground-primary")
        static let primaryLight: UIColor? = UIColor(named: "foreground-light")
    }
    
    struct Background {
        static let primary: UIColor? = UIColor(named: "background-primary")
        static let error: UIColor? = UIColor(named: "background-error")
        static let menuAlternate: UIColor? = UIColor(named: "menu-alternate")
    }
    
    struct Highlight {
        static let purple: UIColor? = UIColor(named: "highlight-purple")
        static let yellow: UIColor? = UIColor(named: "highlight-yellow")
        static let green: UIColor? = UIColor(named: "highlight-green")
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
    static let primaryFont = Color(Colors.fontColor!)
    static let primaryBackground = Color(Colors.Background.primary!)
    static let errorBackground = Color(Colors.Background.error!)
    static let menuAltBackground = Color(Colors.Background.menuAlternate!)
    
    static let purpleHighlight = Color(Colors.Highlight.purple!)
    static let yellowHighlight = Color(Colors.Highlight.yellow!)
    static let greenHighlight = Color(Colors.Highlight.green!)
}
