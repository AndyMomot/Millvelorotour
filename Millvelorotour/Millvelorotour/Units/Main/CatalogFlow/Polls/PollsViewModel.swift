//
//  PollsViewModel.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 01.11.2024.
//

import Foundation

extension PollsView {
    final class ViewModel: ObservableObject {
        @Published var showCatalog = false
        
        var polls: [PollModel] = [
            .init(name: "Pokrittya",
                  answers: [
                    .init(name: "Asfalt"),
                    .init(name: "Góry"),
                    .init(name: "Gleba")
                  ]),
            
                .init(name: "Pogoda",
                      answers: [
                        .init(name: "Rozumiem"),
                        .init(name: "Ślisko"),
                        .init(name: "Deszcz"),
                        .init(name: "Zimno")
                      ]),
            
                .init(name: "Nastrój",
                      answers: [
                        .init(name: "Dobry"),
                        .init(name: "Spokój"),
                        .init(name: "Zmotywowany")
                      ])
        ]
        
        func handleAnswers() {
            DispatchQueue.global().async { [weak self] in
                let answers = self?.polls.map {$0.finalAnswer} ?? []
                guard let self, !answers.contains(where: {
                    $0 == nil || $0?.isEmpty == true
                }) else { return }
                
                DefaultsService.shared.compleatedPolls = true
                
                DispatchQueue.main.async { [self] in
                    self.showCatalog.toggle()
                }
            }
        }
    }
}
