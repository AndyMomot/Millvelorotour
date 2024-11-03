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
                title: "Czym jest wasza aplikacja?",
                text: "Nasza aplikacja umożliwia łatwe i szybkie wypożyczenie roweru na dowolną wycieczkę rowerową. Oferujemy szeroki wybór rowerów na różne trasy i dla różnych poziomów umiejętności."
            ),
            .init(
                title: "Jak wybrać rower na moją wycieczkę?",
                text: "Skorzystaj z naszego wygodnego kwestionariusza. Po udzieleniu odpowiedzi na kilka prostych pytań dotyczących trasy i preferencji otrzymasz spersonalizowaną rekomendację."
            ),
            .init(
                title: "Jakie rodzaje rowerów oferujecie?",
                text: "Nasz katalog obejmuje rowery szosowe, górskie, turystyczne i fatbike. Każdy typ ma swoją własną charakterystykę i nadaje się do różnych rodzajów terenu i stylu jazdy."
            ),
            .init(
                title: "Czy mogę porównać różne modele rowerów?",
                text: "Tak, oczywiście. Nasza aplikacja umożliwia porównanie funkcji i cen różnych modeli rowerów."
            ),
            .init(
                title: "Jak obliczyć cenę wypożyczenia?",
                text: "Cena wynajmu zależy od typu roweru, złożoności trasy i czasu trwania wynajmu. Koszt można obliczyć bezpośrednio w aplikacji przed złożeniem zamówienia."
            ),
            .init(
                title: "Co jeśli chcę przedłużyć wypożyczenie?",
                text: "Wypożyczenie można przedłużyć bezpośrednio w aplikacji. Wystarczy określić nowy czas zwrotu roweru i dopłacić różnicę."
            ),
            .init(
                title: "Jakiego smartfona potrzebuję, aby korzystać z aplikacji?",
                text: "Nasza aplikacja jest kompatybilna z większością nowoczesnych smartfonów na platformie IOS."
            ),
        ]
    }
}
