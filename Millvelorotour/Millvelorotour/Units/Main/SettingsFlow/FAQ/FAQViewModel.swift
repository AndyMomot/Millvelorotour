//
//  FAQViewModel.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 03.11.2024.
//

import Foundation

extension FAQView {
    final class ViewModel: ObservableObject {
        let faqItems: [FAQModel] = [
            .init(
                title: "Jak wybrać odpowiednią taryfę za wynajem?",
                text: "Tak, aplikacja umożliwia dodawanie własnych kategorii wydatków. Możesz śledzić każdą kategorię osobno i ustawić limity budżetowe dla każdej z nich."
            ),
            
                .init(
                    title: "Jak są obliczane dodatkowe koszty remontu i wyposażenia?",
                    text: "Tak, aplikacja umożliwia dodawanie własnych kategorii wydatków. Możesz śledzić każdą kategorię osobno i ustawić limity budżetowe dla każdej z nich."
                ),
            
                .init(
                    title: "Czy mogę dodać własne kategorie wydatków w planowaniu budżetu?",
                    text: "Tak, aplikacja umożliwia dodawanie własnych kategorii wydatków. Możesz śledzić każdą kategorię osobno i ustawić limity budżetowe dla każdej z nich."
                )
        ]
    }
}
