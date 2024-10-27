//
//  RentalsView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 27.10.2024.
//

import SwiftUI

struct RentalsView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Asset.background.swiftUIImage
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    NavigationView(text: "Wypożyczalnie")
                    
                    if viewModel.bicycles.isEmpty {
                        ScrollView {
                            NoBicyclesView {
                                viewModel.showCreateBicycle.toggle()
                            }
                        }
                        .menuIndicator(.hidden)
                    } else {
                        SegmentedControl(
                            items: viewModel.segmentItems,
                            accentColor: Colors.darkBlue.swiftUIColor,
                            secondaryColor: Colors.darkGrey.swiftUIColor,
                            selectedIndex: $viewModel.selectedSegment)
                        
                        
                        ScrollView {
                            if viewModel.selectedSegment == 0 {
                                if !viewModel.showCalculateRentCheck {
                                    CalculateRentView(
                                        bikeTypes: viewModel.bikeTypes,
                                        bikeType: $viewModel.bikeType,
                                        lengthOfLease: $viewModel.lengthOfLease,
                                        date: $viewModel.date)
                                } else {
                                    
                                }
                            } else {
                                
                            }
                            
                        }
                        .menuIndicator(.hidden)
                    }
                }
                .padding(.horizontal, 16)
            }
            .navigationDestination(isPresented: $viewModel.showCreateBicycle) {
                CreateBicycleView()
            }
            .onAppear {
                viewModel.getBicycles()
            }
        }
    }
}

#Preview {
    RentalsView()
}
