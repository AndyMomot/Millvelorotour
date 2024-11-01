//
//  RentsFilterResultsView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 01.11.2024.
//

import SwiftUI

struct RentsFilterResultsView: View {
    var items: [CalculateRentResultModel]
    var action: (ViewAction) -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(spacing: 12) {
                    if items.isEmpty {
                        Text("Według określonego filtra nie znaleziono żadnych rekordów")
                            .foregroundStyle(Colors.blackCustom.swiftUIColor)
                            .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 20))
                            .multilineTextAlignment(.center)
                    } else {
                        ForEach(items.indices, id: \.self) { index in
                            let model = items[index]
                            RentedBikeView(
                                position: index + 1,
                                model: model) { id in
                                    action(.delete(id: id))
                                }
                        }
                    }
                }
                
                NextButton(
                    title: "Wprowadź nowe dane",
                    style: .secondary(color: Colors.powderBlue.swiftUIColor)) {
                        action(.onNext)
                    }
                    .frame(height: 44)
            }
        }
        .menuIndicator(.hidden)
    }
}

#Preview {
    RentsFilterResultsView(
        items: [
            .init(
            type: "Szosowe",
            date: .init(),
            lengthOfLease: 3,
            amount: 1200
            ),
            
            .init(
            type: "Szosowe 2",
            date: .init(),
            lengthOfLease: 4,
            amount: 1400
            )
        ]) {_ in}
        .padding()
}

extension RentsFilterResultsView {
    enum ViewAction {
        case delete(id: String)
        case onNext
    }
}
