//
//  BicycleCell.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 25.10.2024.
//

import SwiftUI

struct BicycleCell: View {
    var model: BicycleModel
    
    var body: some View {
        VStack {
            Text(model.type)
            Text("\(model.price)")
            Text(model.condition)
            
            HStack {
                ScrollView {
                    ForEach(model.tags, id: \.self) { tag in
                        TagView(model: tag, style: .info)
                    }
                }
            }
        }
    }
}

#Preview {
    BicycleCell(model: .init(
        type: "Classic",
        price: 1000,
        condition: "New",
        tags: [.init(title: "Speed"), .init(title: "Fast")])
    )
}
