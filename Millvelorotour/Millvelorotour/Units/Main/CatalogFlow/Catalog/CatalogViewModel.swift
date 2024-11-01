//
//  CatalogViewModel.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 01.11.2024.
//

import Foundation

extension CatalogView {
    final class ViewModel: ObservableObject {
        @Published var text: String = ""
        @Published var type: String = ""
        @Published var condition: String = ""
        @Published var priceFrom: String = ""
        @Published var priceTo: String = ""
        
        @Published var bicycles: [BicycleModel] = []
        @Published var bikeTypes: [String] = []
        @Published var bikeConditions: [String] = []
        @Published var showCreateBicycle = false
        
        func getBicycles() {
            DispatchQueue.global().async {
                let bicycles = DefaultsService.shared.bicycles
                let typesSet = Set(bicycles.map { $0.type })
                let conditionsSet = Set(bicycles.map { $0.condition })
                
                DispatchQueue.main.async { [weak self] in
                    self?.bicycles = bicycles
                    self?.bikeTypes = Array(typesSet)
                    self?.bikeConditions = Array(conditionsSet)
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
        
        func filterBicycle() {
            DispatchSerialQueue.global().async { [weak self] in
                guard let self else { return }
                var bicycles: [BicycleModel] = []
                
                if self.text.isEmpty {
                    bicycles = DefaultsService.shared.bicycles
                } else {
                    bicycles = DefaultsService.shared.bicycles.filter {
                        $0.tags.contains(where: {
                            $0.title.lowercased().contains(self.text.lowercased())
                        })
                    }
                }
                
                DispatchQueue.main.async { [self] in
                    self.bicycles = bicycles.sorted(by: {
                        $0.dateCreated > $1.dateCreated
                    })
                }
            }
        }
    }
}
