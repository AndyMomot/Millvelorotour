//
//  RentsFilterView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 01.11.2024.
//

import SwiftUI

struct RentsFilterView: View {
    var bikeTypes: [String]
    @Binding var bikeType: String
    @Binding var date: Date
    
    var onNext: () -> Void
    
    // Private
    @State private var showBikeTypes = false
    @State private var degrees: Double = -90
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 12) {
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
                
                DatePicker(
                    selection: $date,
                    in: Date()...,
                    displayedComponents: [.date]) {
                        Text("Data")
                            .foregroundStyle(Colors.blackCustom.swiftUIColor)
                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                    }
                    .datePickerStyle(.compact)
            }
            .padding(12)
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Colors.skyBlue.swiftUIColor, lineWidth: 1)
            }
            .padding(1)
            
            NextButton(
                title: "Obliczanie kosztu wynajmu") {
                    onNext()
                }
                .frame(height: 44)
            
            
        }
    }
}

#Preview {
    RentsFilterView(
        bikeTypes: ["Classic", "Sport"],
        bikeType: .constant(""), 
        date: .constant(.init())) {}
        .padding()
}
