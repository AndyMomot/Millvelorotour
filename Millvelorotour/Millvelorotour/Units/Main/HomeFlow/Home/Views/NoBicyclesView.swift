//
//  NoBicyclesView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 25.10.2024.
//

import SwiftUI

struct NoBicyclesView: View {
    var onCreate: () -> Void
    
    var body: some View {
        ZStack {
            Color.white
            VStack(spacing: 24) {
                Group {
                    Text("Nie masz jeszcze utworzonych żadnych rowerów, aby dodać kartę z nowym rowerem, musisz kliknąć przycisk poniżej")
                        .foregroundColor(Colors.steelBlue.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 18))
                    +
                    Text(" „Dodaj nowy rower”.")
                        .foregroundColor(.black)
                        .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 18))
                }
                .multilineTextAlignment(.center)
                
                NextButton(title: "Dodaj nowe rowery") {
                    onCreate()
                }
                .frame(height: 48)
            }
            .padding()
        }
        .cornerRadius(8, corners: .allCorners)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Colors.skyBlue.swiftUIColor, lineWidth: 1)
        }
    }
}

#Preview {
    ZStack {
        Asset.background.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        NoBicyclesView {}
            .padding()
    }
}
