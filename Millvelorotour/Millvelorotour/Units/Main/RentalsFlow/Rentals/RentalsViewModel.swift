//
//  RentalsViewModel.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 27.10.2024.
//

import Foundation

extension RentalsView {
    final class ViewModel: ObservableObject {
        @Published var showCreateBicycle = false
        
        let segmentItems = ["Obliczanie czynszu", "Zarządzanie najmem"]
        @Published var selectedSegment: Int = 0
        
        @Published var bicycles: [BicycleModel] = []
        @Published var bikeTypes: [String] = []
        
        @Published var bikeType = ""
        @Published var lengthOfLease = ""
        @Published var date = Date()
        
        @Published var showCalculateRentCheck = false
        
        func getBicycles() {
            DispatchQueue.global().async {
                let bicycles = DefaultsService.shared.bicycles
                let types = bicycles.map { $0.type }
                
                DispatchQueue.main.async { [weak self] in
                    self?.bicycles = bicycles
                    self?.bikeTypes = types
                }
            }
        }
    }
}
