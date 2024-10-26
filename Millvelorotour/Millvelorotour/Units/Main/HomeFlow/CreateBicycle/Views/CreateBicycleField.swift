//
//  CreateBicycleField.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 26.10.2024.
//

import SwiftUI

struct CreateBicycleField: View {
    var title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
            
            VStack(alignment: .leading, spacing: 6) {
                TextField("", text: $text)
                    .foregroundStyle(Colors.darkGrey.swiftUIColor)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                
                Rectangle()
                    .foregroundStyle(Colors.darkGrey.swiftUIColor)
                    .opacity(0.5)
                    .frame(height: 1)
            }
            
        }
    }
}

#Preview {
    CreateBicycleField(title: "Typ", text: .constant(""))
        .padding()
}
