//
//  SearchView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 01.11.2024.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String
    @Binding var type: String
    @Binding var condition: String
    @Binding var priceFrom: String
    @Binding var priceTo: String
    
    var bikeTypes: [String]
    var bikeConditions: [String]
    
    // Private
    @State private var showFilter = false
    @State private var showBikeTypes = false
    @State private var typesDegrees: Double = -90
    @State private var showBikeConditions = false
    @State private var conditionsDegrees: Double = -90
    
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 12) {
                HStack(spacing: 8) {
                    Asset.search.swiftUIImage
                    
                    TextField(text: $text) {
                        Text("Szukaj...")
                            .foregroundStyle(Colors.darkGrey.swiftUIColor)
                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                    }
                }
                .padding(12)
                .background(.white)
                .cornerRadius(8, corners: .allCorners)
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Colors.skyBlue.swiftUIColor, lineWidth: 1)
                }
                .padding(1)
                
                Button {
                    withAnimation { showFilter.toggle() }
                } label: {
                    Asset.filter.swiftUIImage
                        .padding(.vertical, 12)
                        .padding(.horizontal, 6)
                        .background(.white)
                        .cornerRadius(8, corners: .allCorners)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(
                                    showFilter ? Colors.darkBlue.swiftUIColor : Colors.skyBlue.swiftUIColor,
                                    lineWidth: 1
                                )
                        }
                        .padding(1)
                }
            }
            
            if showFilter {
                VStack(spacing: 12) {
                    HStack {
                        // Title
                        Text("Filtr")
                            .foregroundStyle(Colors.darkGrey.swiftUIColor)
                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                        Spacer()
                        Button {
                            withAnimation { showFilter.toggle() }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        }
                    }
                    
                    // Type
                    HStack {
                        InputField(title: "Typ Rowery",
                                   placeholder: "Typ",
                                   text: $type)
                        Button {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showBikeTypes.toggle()
                                typesDegrees += 180
                            }
                        } label: {
                            Asset.arrowBack.swiftUIImage
                                .rotationEffect(.degrees(typesDegrees))
                        }
                    }
                    
                    if showBikeTypes {
                        HStack(spacing: 12) {
                            ForEach(bikeTypes, id: \.self) { type in
                                let model = TagModel(title: type)
                                Button {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        self.type = type
                                        showBikeTypes.toggle()
                                        typesDegrees += 180
                                    }
                                } label: {
                                    TagView(model: model, style: .info)
                                }
                            }
                            Spacer()
                        }
                    }
                    
                    // Condition
                    HStack {
                        InputField(title: "Stan",
                                   placeholder: "Stan",
                                   text: $condition)
                        Button {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showBikeConditions.toggle()
                                conditionsDegrees += 180
                            }
                        } label: {
                            Asset.arrowBack.swiftUIImage
                                .rotationEffect(.degrees(conditionsDegrees))
                        }
                    }
                    
                    if showBikeConditions {
                        HStack(spacing: 12) {
                            ForEach(bikeConditions, id: \.self) { condition in
                                let model = TagModel(title: condition)
                                Button {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        self.condition = condition
                                        showBikeConditions.toggle()
                                        conditionsDegrees += 180
                                    }
                                } label: {
                                    TagView(model: model, style: .info)
                                }
                            }
                            Spacer()
                        }
                    }
                    
                    HStack {
                        InputField(title: "Cenna z",
                                   placeholder: "0.00",
                                   text: $priceFrom)
                        .keyboardType(.numberPad)
                        
                        InputField(title: "Cenna do",
                                   placeholder: "0.00",
                                   text: $priceTo)
                        .keyboardType(.numberPad)
                    }
                }
                .padding(12)
                .background(.white)
                .cornerRadius(8, corners: .allCorners)
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Colors.skyBlue.swiftUIColor,
                                lineWidth: 1
                        )
                }
                .padding(1)
            }
        }
    }
}

#Preview {
    ZStack {
        Asset.background.swiftUIImage
            .resizable()
        
        SearchView(text: .constant(""),
                   type: .constant(""),
                   condition: .constant(""),
                   priceFrom: .constant(""),
                   priceTo: .constant(""),
                   bikeTypes: ["Classic", "Sport"],
                   bikeConditions: ["New", "Used"])
        .padding()
    }
}
