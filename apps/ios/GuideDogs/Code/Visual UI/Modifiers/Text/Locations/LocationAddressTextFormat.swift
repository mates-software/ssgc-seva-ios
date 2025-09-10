//
//  LocationAddressTextFormat.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation
import SwiftUI

struct LocationAddressTextFormat: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.primaryForeground)
            .font(.footnote)
            .accessibleTextFormat()
    }
    
}
