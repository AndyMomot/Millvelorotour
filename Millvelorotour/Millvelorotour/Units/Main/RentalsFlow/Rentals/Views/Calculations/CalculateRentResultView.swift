//
//  CalculateRentResultView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 01.11.2024.
//

import SwiftUI

struct CalculateRentResultView: View {
    var model: CalculateRentResultModel
    var onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 12) {
                HStack {
                    Text("Obliczenia")
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 20))
                    Spacer()
                }
                
                HStack {
                    Text("Typ Rowery")
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                    Spacer()
                    Text(model.type)
                        .foregroundStyle(Colors.darkGrey.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                }
                
                HStack {
                    Text("Długość najmu")
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                    Spacer()
                    Text("\(model.lengthOfLease)h")
                        .foregroundStyle(Colors.darkGrey.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                }
                
                HStack {
                    Text("Data")
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                    Spacer()
                    Text(model.date.toString(format: .ddMMyyyy))
                        .foregroundStyle(Colors.darkGrey.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                }
                
                HStack {
                    Text("Czas")
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                    Spacer()
                    Text(model.date.toString(format: .HHMM))
                        .foregroundStyle(Colors.darkGrey.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                }
                
                
                HStack {
                    Text("Łącznie")
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 18))
                    Spacer()
                    Text("\(model.amount)".toNumberFormat())
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 24))
                }
            }
            .padding(12)
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Colors.skyBlue.swiftUIColor, lineWidth: 1)
            }
            .padding(1)
            
            NextButton(
                title: "Wprowadź nowe dane",
                style: .secondary(color: Colors.powderBlue.swiftUIColor)) {
                    onNext()
                }
                .frame(height: 44)
        }
    }
}

#Preview {
    CalculateRentResultView(model:
            .init(
                type: "Szosowe",
                date: .init(),
                lengthOfLease: 3,
                amount: 1200
            )) {}
    .padding()
}
