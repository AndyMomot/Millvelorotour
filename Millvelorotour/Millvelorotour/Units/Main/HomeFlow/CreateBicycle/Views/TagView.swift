//
//  TagView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 26.10.2024.
//

import SwiftUI

struct TagView: View {
    var model: TagModel
    var style: Style
    var action: ((Action) -> Void)?
    
    var body: some View {
        HStack(spacing: 8) {
            Text(model.title)
                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                .lineLimit(1)
            
            switch style {
            case .deletable:
                Button {
                    action?(.delete(id: model.id))
                } label: {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(Colors.redCustom.swiftUIColor)
                }

            case .info:
                EmptyView()
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 9)
        .cornerRadius(8, corners: .allCorners)
        .overlay {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Colors.darkBlue.swiftUIColor, lineWidth: 1)
        }
        .padding(1)
    }
}

extension TagView {
    enum Style {
        case deletable
        case info
    }
    
    enum Action {
        case delete(id: String)
    }
}

#Preview {
    VStack(spacing: 20) {
        TagView(model: .init(title: "Osie wsuwane"), style: .deletable) {_ in}
        TagView(model: .init(title: "Osie wsuwane"), style: .info)
    }
}
