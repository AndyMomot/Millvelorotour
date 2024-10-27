//
//  CalculateRentView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 27.10.2024.
//

import SwiftUI

struct CalculateRentView: View {
    var bikeTypes: [String]
    @Binding var bikeType: String
    @Binding var lengthOfLease: String
    @Binding var date: Date
    
    // Private
    @State private var showBikeTypes = false
    @State private var degrees: Double = -90
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 24) {
                HStack {
                    InputField(title: "Typ Rowery",
                               text: $bikeType)
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            showBikeTypes.toggle()
                            degrees += 180
                        }
                    } label: {
                        Asset.arrowBack.swiftUIImage
                            .rotationEffect(.degrees(degrees))
                    }
                }
                
                if showBikeTypes {
                    HStack(spacing: 12) {
                        ForEach(bikeTypes, id: \.self) { type in
                            let model = TagModel(title: type)
                            Button {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    bikeType = type
                                    showBikeTypes.toggle()
                                    degrees += 180
                                }
                            } label: {
                                TagView(model: model, style: .info)
                            }
                        }
                        Spacer()
                    }
                }
                
                InputField(title: "Długość najmu",
                           placeholder: "0h",
                           text: $lengthOfLease)
                .keyboardType(.numberPad)
                
                DatePicker(
                    selection: $date,
                    in: Date()...,
                    displayedComponents: [.date, .hourAndMinute]) {
                        Text("Data i godzina")
                            .foregroundStyle(Colors.blackCustom.swiftUIColor)
                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                    }
                    .datePickerStyle(.compact)
            }
            .padding(12)
            .background(.white)
            .cornerRadius(8, corners: .allCorners)
            .overlay {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Colors.darkBlue.swiftUIColor, lineWidth: 1)
            }
            .padding(1)
            
            NextButton(title: "Obliczanie kosztu wynajmu") {
                
            }
            .frame(height: 48)
        }
    }
}

#Preview {
    CalculateRentView(
        bikeTypes: ["Classic", "Sport"],
        bikeType: .constant(""),
        lengthOfLease: .constant(""), 
        date: .constant(.init()))
    .padding()
}
