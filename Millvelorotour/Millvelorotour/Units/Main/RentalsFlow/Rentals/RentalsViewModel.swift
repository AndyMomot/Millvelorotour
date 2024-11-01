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
        @Published var rentResults: [CalculateRentResultModel] = []
        
        @Published var bikeType = ""
        @Published var lengthOfLease = ""
        @Published var date = Date()
        @Published var showCalculateRentCheck = false
        @Published var showRentsFilterResults = false
        
        var rentResultModel: CalculateRentResultModel?
        
        func getBicycles() {
            DispatchQueue.global().async {
                let bicycles = DefaultsService.shared.bicycles
                let typesSet = Set(bicycles.map { $0.type })
                
                DispatchQueue.main.async { [weak self] in
                    self?.bicycles = bicycles
                    self?.bikeTypes = Array(typesSet)
                }
            }
        }
        
        func createRentCheck() {
            DispatchQueue.global().async { [weak self] in
                guard let self, 
                !self.bikeType.isEmpty,
                !self.lengthOfLease.isEmpty
                else { return }
                
                var amount = 0
                let hours = Int(self.lengthOfLease) ?? 1
                var rentPerHour = 500
                
                if let bike = self.bicycles.first(where: { $0.type == self.bikeType }) {
                    rentPerHour = Int(Double(bike.price) * 0.12)
                }
                
                amount = rentPerHour * hours
                
                let model = CalculateRentResultModel(
                    type: self.bikeType,
                    date: self.date,
                    lengthOfLease: hours,
                    amount: amount
                )
                
                self.rentResultModel = model
                
                DefaultsService.shared.calculateRentResults.append(model)
                
                DispatchQueue.main.async { [self] in
                    self.showCalculateRentCheck = true
                }
            }
        }
        
        func searchRentChecks() {
            DispatchQueue.global().async { [weak self] in
                guard let self, !self.bikeType.isEmpty else { return }
                let rentResults = DefaultsService.shared.calculateRentResults.sorted(by: {
                    $0.date < $1.date
                })
                    .filter {
                        $0.type == self.bikeType &&
                        $0.date.toString(format: .ddMMyyyy) == self.date.toString(format: .ddMMyyyy)
                    }
                
                DispatchQueue.main.async { [self] in
                    self.rentResults = rentResults
                    self.showRentsFilterResults = true
                }
            }
        }
        
        func handleCheckItem(action: RentsFilterResultsView.ViewAction) {
            switch action {
            case .delete(let id):
                DispatchQueue.global().async { [weak self] in
                    guard let self else { return }
                    
                    if let index = DefaultsService.shared.calculateRentResults.firstIndex(where: {
                        $0.id == id
                    }) {
                        DefaultsService.shared.calculateRentResults.remove(at: index)
                    }
                    
                    self.searchRentChecks()
                }
            case .onNext:
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.showRentsFilterResults = false
                }
            }
        }
    }
}
