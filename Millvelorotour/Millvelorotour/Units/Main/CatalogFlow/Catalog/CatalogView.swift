//
//  CatalogView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 01.11.2024.
//

import SwiftUI

struct CatalogView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Asset.background.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                NavigationView(text: "Katalog")
                    .padding(.horizontal, 16)
                
                VStack(spacing: 12) {
                    SearchView(
                        text: $viewModel.text,
                        type: $viewModel.type,
                        condition: $viewModel.condition,
                        priceFrom: $viewModel.priceFrom,
                        priceTo: $viewModel.priceTo, 
                        bikeTypes: viewModel.bikeTypes,
                        bikeConditions: viewModel.bikeConditions)
                        .padding(.horizontal, 16)
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            if viewModel.bicycles.isEmpty {
                                NoBicyclesView {
                                    viewModel.showCreateBicycle.toggle()
                                }
                            } else {
                                ForEach(viewModel.bicycles) { item in
                                    BicycleCell(model: item) { id in
                                        viewModel.deleteBicycle(id: id)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                    }
                    .scrollIndicators(.never)
                }
            }
        }
        .onAppear {
            withAnimation {
                viewModel.getBicycles()
            }
        }
        .navigationDestination(isPresented: $viewModel.showCreateBicycle) {
            CreateBicycleView()
        }
        
        .onChange(of: viewModel.text) { _ in
            viewModel.filterBicycle()
        }
        .onChange(of: viewModel.type) { _ in
            viewModel.filterBicycle()
        }
        .onChange(of: viewModel.condition) { _ in
            viewModel.filterBicycle()
        }
        .onChange(of: viewModel.priceFrom) { _ in
            viewModel.filterBicycle()
        }
        .onChange(of: viewModel.priceTo) { _ in
            viewModel.filterBicycle()
        }
        .hideKeyboardWhenTappedAround()
    }
}

#Preview {
    CatalogView()
}
