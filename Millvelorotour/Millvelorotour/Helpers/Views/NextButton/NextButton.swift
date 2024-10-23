//
//  NextButton.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import SwiftUI

struct NextButton: View {
    var title: String
    var bgColors: [Color] = []
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Colors.darkBlue.swiftUIColor
                
                Text(title)
                    .foregroundStyle(.white)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 18))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.8)
                    .padding(.horizontal, 8)
                
            }
            .cornerRadius(8, corners: .allCorners)
        }
    }
}

#Preview {
    ZStack {
       
        NextButton(title: "Komputeryrerererer") {}
            .frame(width: 200, height: 44)
    }
}
