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
        
        var rentResultModel: CalculateRentResultView.CalculateRentResultModel?
        
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
                
                self.rentResultModel = CalculateRentResultView.CalculateRentResultModel(
                    type: self.bikeType,
                    lengthOfLease: self.lengthOfLease,
                    date: self.date.toString(format: .ddMMyyyy),
                    time: self.date.toString(format: .HHMM),
                    amount: "\(amount)".toNumberFormat()
                )
                
                DispatchQueue.main.async { [self] in
                    self.showCalculateRentCheck = true
                }
            }
        }
    }
}
