//
//  OnboardingButtonTextStyle.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation
import SwiftUI

struct OnboardingButtonTextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 24.0)
            .roundedBackground(Color.primaryFont)
            .foregroundColor(Color.primaryBackground)
            .accessibleTextFormat()
    }
    
}

extension Text {
    
    func onboardingButtonTextStyle() -> some View {
        modifier(OnboardingButtonTextStyle())
    }

}
