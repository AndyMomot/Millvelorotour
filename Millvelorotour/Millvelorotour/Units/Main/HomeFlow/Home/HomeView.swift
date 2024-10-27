//
//  HomeView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 25.10.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Asset.background.swiftUIImage
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    NavigationView(text: "Rowery", rightView:  {
                        if !viewModel.bicycles.isEmpty {
                            NavigationButton(imageName: "plus") {
                                viewModel.showCreateBicycle.toggle()
                            }
                        }
                    })
                    
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
                        .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                    }
                    .scrollIndicators(.never)
                }
                .padding(.horizontal, 16)
            }
            .onAppear {
                withAnimation {
                    viewModel.getBicycles()
                }
            }
            .navigationDestination(isPresented: $viewModel.showCreateBicycle) {
                CreateBicycleView()
            }
        }
    }
}

#Preview {
    HomeView()
}
