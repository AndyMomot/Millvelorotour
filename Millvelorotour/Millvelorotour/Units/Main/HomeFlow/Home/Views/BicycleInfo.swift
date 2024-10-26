//
//  BicycleInfo.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 26.10.2024.
//

import SwiftUI

struct BicycleInfo: View {
    var title, value: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .foregroundStyle(Colors.darkGrey.swiftUIColor)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
            
            Text(value)
                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 18))
        }
        .multilineTextAlignment(.center)
    }
}

#Preview {
    BicycleInfo(
        title: "Typ",
        value: "Szosowe"
    )
}
