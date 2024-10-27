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
        
        func deleteBicycle(id: String) {
            DispatchQueue.global().async { [weak self] in
                guard let self, 
                let index = DefaultsService.shared.bicycles.firstIndex(where: {
                    $0.id == id
                }) else { return }
                DefaultsService.shared.bicycles.remove(at: index)
                
                self.getBicycles()
            }
        }
    }
}
