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
            VStack(spacing: 24) {
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
                    Text(model.lengthOfLease + "h")
                        .foregroundStyle(Colors.darkGrey.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                }
                
                HStack {
                    Text("Data")
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                    Spacer()
                    Text(model.date)
                        .foregroundStyle(Colors.darkGrey.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                }
                
                HStack {
                    Text("Czas")
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                    Spacer()
                    Text(model.time)
                        .foregroundStyle(Colors.darkGrey.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                }
                
                
                HStack {
                    Text("Łącznie")
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 18))
                    Spacer()
                    Text(model.amount)
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 24))
                }
            }
            .padding(12)
            .overlay {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Colors.darkBlue.swiftUIColor, lineWidth: 1)
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
    CalculateRentResultView(model: .init(
        type: "Szosowe",
        lengthOfLease: "3",
        date: "14.10.2024",
        time: "13:00",
        amount: "1 200"
    )) {}
    .padding()
}


extension CalculateRentResultView {
    struct CalculateRentResultModel {
        var type, lengthOfLease, date, time, amount: String
    }
}

