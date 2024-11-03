//
//  SettingsButton.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 03.11.2024.
//

import SwiftUI

struct SettingsButton: View {
    var type: ButtonType
    var showUnderLine = true
    var voidAction: (() -> Void)?
    var isOnAction: ((Bool) -> Void)?
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text(type.title)
                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
                
                Spacer()
                
                switch type {
                case .link:
                    Button {
                        voidAction?()
                    } label: {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Colors.blackCustom.swiftUIColor)
                            .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
                            .padding(8)
                    }

                case .toggle(_, let isOn):
                    Button {
                        isOnAction?(!isOn)
                    } label: {
                        Toggle("", isOn: .constant(isOn))
                    }

                case .value(_, let value):
                    Text(value)
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 20))
                }
            }
            .padding(.horizontal, 8)
            
            if showUnderLine {
                Rectangle()
                    .foregroundStyle(Colors.skyBlue.swiftUIColor)
                    .frame(height: 1)
            }
        }
    }
}

extension SettingsButton {
    enum ButtonType {
        case link(title: String)
        case toggle(title: String, isOn: Bool)
        case value(title: String, value: String)
        
        var title: String {
            switch self {
            case .link(let title):
                return title
            case .toggle(let title, _):
                return title
            case .value(let title, _):
                return title
            }
        }
    }
}

#Preview {
    ZStack {
        Asset.background.swiftUIImage
            .resizable()
        
        VStack(spacing: 20) {
            SettingsButton(type: .link(title: "FAQ")) {}
            
            SettingsButton(type: .toggle(
                title: "Dźwięki powiadomień",
                isOn: true), isOnAction:  { _ in })
            
            SettingsButton(type: .value(
                title: "Wersja aplikacji",
                value: "1.00v"
            ),
                           showUnderLine: false)
        }
        .padding()
    }
}
