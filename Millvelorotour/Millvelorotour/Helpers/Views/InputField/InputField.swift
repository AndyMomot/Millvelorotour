//
//  CreateBicycleField.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 26.10.2024.
//

import SwiftUI

struct InputField: View {
    var title: String
    var placeholder: String?
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
            
            VStack(alignment: .leading, spacing: 4) {
                TextField(text: $text) {
                    if let placeholder {
                        Text(placeholder)
                            .foregroundStyle(Colors.darkGrey.swiftUIColor)
                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                            .opacity(0.8)
                    }
                }
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
    InputField(title: "Typ", text: .constant(""))
        .padding()
}
