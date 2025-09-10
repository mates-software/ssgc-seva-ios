//
//  LinearGradientViewBackground.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation
import SwiftUI

struct LinearGradientBackground: ViewModifier {
    
    let gradient: Gradient
    let ignoresSafeArea: Bool
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    
    @ViewBuilder
    private var linearGradientView: some View {
        LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint)
    }
    
    func body(content: Content) -> some View {
        if ignoresSafeArea {
            ZStack {
                linearGradientView
                    .ignoresSafeArea()
                
                content
            }
        } else {
            content
                .background(
                    linearGradientView
                )
        }
    }
    
}

extension View {
    
    func linearGradientBackground(_ gradient: Gradient, ignoresSafeArea: Bool = false) -> some View {
        modifier(LinearGradientBackground(gradient: gradient, ignoresSafeArea: ignoresSafeArea, startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    func linearGradientBackground(_ gradient: Gradient, start: UnitPoint, end: UnitPoint, ignoresSafeArea: Bool = false) -> some View {
        modifier(LinearGradientBackground(gradient: gradient, ignoresSafeArea: ignoresSafeArea, startPoint: start, endPoint: end))
    }
    
}
