//
//  BicycleCell.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 25.10.2024.
//

import SwiftUI

struct BicycleCell: View {
    var model: BicycleModel
    
    @State private var image: Image?
    
    var body: some View {
        VStack(spacing: 12) {
            if let image {
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                Asset.placeholder.swiftUIImage
                    .resizable()
                    .scaledToFit()
            }
            
            HStack(spacing: 12) {
                Spacer()
                BicycleInfo(title: "Typ", value: model.type)
                Spacer()
                BicycleInfo(title: "Cena", value: "\(model.price)".toNumberFormat())
                Spacer()
                BicycleInfo(title: "Stan", value: model.condition)
                Spacer()
            }
            
            Text("Osobliwość")
                .foregroundStyle(Colors.darkGrey.swiftUIColor)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                .multilineTextAlignment(.center)
                .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(model.tags, id: \.self) { tag in
                        TagView(model: tag, style: .info)
                    }
                }
            }
        }
        .padding(12)
        .cornerRadius(8, corners: .allCorners)
        .background(.white)
        .overlay {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Colors.darkBlue.swiftUIColor, lineWidth: 1)
        }
        .padding(1)
        .onAppear {
            getImage()
        }
    }
}

private extension BicycleCell {
    func getImage()  {
        let isStorageManager = ImageStorageManager()
        isStorageManager.fetchImage(with: model.id) { data in
            guard let data, let uiImage = UIImage(data: data)
            else { return }
            withAnimation {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

#Preview {
    BicycleCell(model: .init(
        type: "Classic",
        price: 10000,
        condition: "New",
        tags: [.init(title: "Speed"), .init(title: "Fast")])
    )
    .padding()
}
