//
//  RentedBikeView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 01.11.2024.
//

import SwiftUI

struct RentedBikeView: View {
    var position: Int
    var model: CalculateRentResultModel
    var onDelete: (String) -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("№\(position)")
                Spacer()
                Button {
                    onDelete(model.id)
                } label: {
                    Image(systemName: "trash.fill")
                }
            }
            .foregroundStyle(Colors.blackCustom.swiftUIColor)
            .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 20))
            
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
                Text("Długość najmu")
                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                Spacer()
                Text("\(model.lengthOfLease)h")
                    .foregroundStyle(Colors.darkGrey.swiftUIColor)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
            }
            
            HStack {
                Text("Czas powrotu")
                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                Spacer()
                Text(model.timeReturn)
                    .foregroundStyle(Colors.darkGrey.swiftUIColor)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
            }
        }
        .padding(12)
        .background(.white)
        .overlay {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Colors.skyBlue.swiftUIColor, lineWidth: 1)
        }
        .padding(1)
    }
}

#Preview {
    RentedBikeView(
        position: 1,
        model: .init(
        type: "Szosowe",
        date: .init(),
        lengthOfLease: 3,
        amount: 1200
        )) {_ in}
    .padding()
}
