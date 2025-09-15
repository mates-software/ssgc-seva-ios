//
//  LocationNameTextFormat.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation
import SwiftUI

struct LocationNameTextFormat: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.primaryFont)
            .font(.body)
            .accessibleTextFormat()
    }
    
}
