//
//  TabBarCustomView.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 13.06.2024.
//

import SwiftUI

struct TabBarCustomView: View {
    @Binding var selectedItem: Int
    
    @State private var items: [TabBar.Item] = [
        .init(imageName: Asset.bicyclesTab.name,
              title: "Rowery"),
        .init(imageName: Asset.rentalTab.name,
              title: "Wypożyczalnie"),
        .init(imageName: Asset.catalogTab.name,
              title: "Katalog"),
        .init(imageName: Asset.settingsTab.name,
              title: "Ustawienia")
    ]
    
    private var arrange: [Int] {
        Array(0..<items.count)
    }
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .overlay {
                    HStack {
                        let arrange = (0..<items.count)
                        ForEach(arrange, id: \.self) { index in
                            let item = items[index]
                            let isSelected = index == selectedItem
                            
                            VStack {
                                Rectangle()
                                    .foregroundStyle(Colors.darkBlue.swiftUIColor)
                                    .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                                    .frame(height: 4)
                                    .opacity(isSelected ? 1 : 0)
                                
                                Spacer()
                                
                                VStack(spacing: 4) {
                                    Image(item.imageName)
                                        .renderingMode(.template)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24)
                                    
                                    Text(item.title)
                                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 10))
                                }
                                .foregroundStyle(
                                    isSelected ? Colors.darkBlue.swiftUIColor : Colors.darkGrey.swiftUIColor
                                )
                                
                                Spacer()
                            }
                            .onTapGesture {
                                selectedItem = index
                            }
                        }
                    }
                    .padding(.horizontal, bounds.width * 0.1)
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    ZStack {
        Asset.preloaderBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        VStack {
            Spacer()
            TabBarCustomView(selectedItem: .constant(0))
                .frame(height: 126)
        }
        .ignoresSafeArea()
    }
}
