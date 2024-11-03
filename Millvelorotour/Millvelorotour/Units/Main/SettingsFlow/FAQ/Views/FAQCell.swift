//
//  FAQCell.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 03.11.2024.
//

import SwiftUI

struct FAQCell: View {
    var index: Int
    var model: FAQModel
    
    @State private var showText = false
    @State private var degrees: Double = -90
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: .zero) {
                Text("\(index). \(model.title)")
                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 16))
                Spacer(minLength: 12)
                Button {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        showText.toggle()
                        degrees += 180
                    }
                } label: {
                    Asset.arrowBack.swiftUIImage
                        .padding(.vertical, 12)
                        .rotationEffect(.degrees(degrees))
                }
            }
            
            if showText {
                Text(model.text)
                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
            }
            
            Rectangle()
                .foregroundStyle(Colors.skyBlue.swiftUIColor)
                .frame(height: 1)
        }
    }
}

#Preview {
    FAQCell(
        index: 1,
        model: .init(
            title: "Czy mogę dodać własne kategorie wydatków w planowaniu budżetu?",
            text: "Tak, aplikacja umożliwia dodawanie własnych kategorii wydatków. Możesz śledzić każdą kategorię osobno i ustawić limity budżetowe dla każdej z nich."))
    .padding(12)
}
