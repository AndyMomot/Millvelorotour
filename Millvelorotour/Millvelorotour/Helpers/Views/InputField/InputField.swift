////
////  InputField.swift
////  Tradifundint
////
////  Created by Andrii Momot on 08.07.2024.
////
//
import SwiftUI

struct InputField: View {
    var title: String
    var titleColor: Color = .black
    var textColor: Color = .black
    var placeholder: String = "Napisz tekst"
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundStyle(titleColor)
                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 15))
            
            TextField(text: $text) {
                Text(placeholder)
                    
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 15))
            }
            .foregroundStyle(textColor)
            .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 15))
            .padding(.horizontal, 16)
            .padding(.vertical, 18)
            .background(.white)
            .cornerRadius(20, corners: .allCorners)
        }
    }
}

#Preview {
    ZStack {
        
        InputField(title: "Nazwa towaru", text: .constant(""))
            .padding(.horizontal)
    }
}
