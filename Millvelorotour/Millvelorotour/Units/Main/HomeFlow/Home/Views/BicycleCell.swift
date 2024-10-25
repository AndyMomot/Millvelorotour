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
                        Text(tag)
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
        tags: ["Speed", "Fast"])
    )
}
