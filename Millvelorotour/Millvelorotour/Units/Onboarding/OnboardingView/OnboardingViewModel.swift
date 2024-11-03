//
//  OnboardingViewModel.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 12.06.2024.
//

import Foundation

extension OnboardingView {
    final class OnboardingViewModel: ObservableObject {
        @Published var showPrivacyPolicy = false
        let privacyPolicyURL = URL(string: "https://millvelorotour.info/")
        
        func showMainFlow(rootViewModel: RootContentView.RootContentViewModel) {
            DispatchQueue.main.async {
                rootViewModel.setFlow(.main)
            }
        }
    }
    
    enum OnboardingItem: Int, CaseIterable {
        case first = 0
        case second
        case third
        
        var image: String {
            switch self {
            case .first:
                return Asset.onboard1.name
            case .second:
                return Asset.onboard2.name
            case .third:
                return Asset.onboard3.name
            }
        }
        
        var title: String {
            switch self {
            case .first:
                return "Zaplanuj wypożyczalnię rowerów"
            case .second:
                return "Oblicz koszt wypożyczenia roweru"
            case .third:
                return "Dzięki prostemu kwestionariuszowi"
            }
        }
    
        var text: String {
            switch self {
            case .first:
                return "Na wycieczki rowerowe i wyprawy po górskich szlakach! Dowiedz się z katalogu rowerów sportowych i górskich, które najlepiej pasują do planowanych wycieczek!"
            case .second:
                return "Na podstawie trasy i jej charakterystyki. Rejestruj liczbę wypożyczonych rowerów i czas ich zwrotu. Śledź wypożyczenia, upewniając się, że rowery są dostępne dla nowych użytkowników."
            case .third:
                return "Możesz wybrać rower, który odpowiada Twoim potrzebom. Wybieraj szybko, licz efektywnie i rozwijaj swój rowerowy biznes!"
            }
        }
        
        var next: Self {
            switch self {
            case .first:
                return .second
            case .second, .third:
                return .third
            }
        }
    }
}
