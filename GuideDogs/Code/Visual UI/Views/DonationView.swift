//
//  DonationView.swift
//  Seva
//
//  Created by Robert Murray on 29/01/2025.
//  Copyright © 2025 Soundscape community. Licensed under the MIT license

import SwiftUI

struct DonationView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Spacer(minLength: 0)
            VStack(spacing: 32.0) {
                GDLocalizedTextView("donation.title")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color.primaryFont)
                    .accessibilityAddTraits(.isHeader)
                GDLocalizedTextView("donation.body")
                    .font(.body)
                    .foregroundColor(Color.primaryFont)
                Button(action: {
                    if let url = URL(string: "https://gofund.me/1441f743") {
                        UIApplication.shared.open(url)
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    GDLocalizedTextView("donation.link")
                        .onboardingButtonTextStyle()
                }
            }
            .offset(y: -24)
            .padding(.horizontal, 18.0)
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primaryBackground.ignoresSafeArea())
    }
}

#Preview {
    DonationView()
}
