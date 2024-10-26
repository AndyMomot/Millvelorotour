//
//  HomeViewModel.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 25.10.2024.
//

import Foundation

extension HomeView {
    final class HomeViewModel: ObservableObject {
        @Published var bicycles: [BicycleModel] = []
        @Published var showCreateBicycle = false
        
        func getBicycles() {
            DispatchQueue.global().async { [weak self] in
                guard let self else { return }
                let bicycles = DefaultsService.shared.bicycles
                DispatchQueue.main.async { [self] in
                    self.bicycles = bicycles.sorted(by: {
                        $0.dateCreated > $1.dateCreated
                    })
                }
            }
        }
    }
}
