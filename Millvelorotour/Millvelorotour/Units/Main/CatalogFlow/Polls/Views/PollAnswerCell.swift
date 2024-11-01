//
//  PollAnswerCell.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 01.11.2024.
//

import SwiftUI

struct PollAnswerCell: View {
    var item: PollAnswer
    @Binding var selectedAnswer: String?
    
    var body: some View {
        Button {
            selectedAnswer = item.name
        } label: {
            HStack(spacing: 8) {
                if selectedAnswer == item.name {
                    Circle()
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .frame(width: 18)
                        .padding(6)
                } else {
                    Circle()
                        .stroke(Colors.blackCustom.swiftUIColor,
                                lineWidth: 1)
                        .frame(width: 18)
                        .padding(6)
                }
                
                Text(item.name)
                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                
                Spacer()
            }
        }
    }
}

#Preview {
    VStack {
        PollAnswerCell(item: .init(id: "0", name: "Asfalt"),
                       selectedAnswer: .constant(nil))
        
        PollAnswerCell(item: .init(id: "1", name: "Góry"),
                       selectedAnswer: .constant("Góry"))
    }
}
