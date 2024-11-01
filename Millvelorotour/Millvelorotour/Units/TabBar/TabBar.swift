//
//  TabBar.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 13.06.2024.
//

import SwiftUI

struct TabBar: View {
    @StateObject private var viewModel = TabBarViewModel()
    @State private var showTabBar = true
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $viewModel.selection) {
            HomeView()
                .tag(TabBarSelectionView.bicycles.rawValue)
            
            RentalsView()
                .tag(TabBarSelectionView.rentals.rawValue)
            
            CatalogsRootView()
                .tag(TabBarSelectionView.catalog.rawValue)
            
            VStack {
                ScrollView {
                    VStack {
                        Text("Settings")
                        
                        ForEach(0..<10) { _ in
                            Rectangle()
                                .foregroundStyle(.gray)
                                .frame(height: 100)
                                .padding(.horizontal)
                        }
                    }
                }
            }
                .tag(TabBarSelectionView.settings.rawValue)
        }
        .overlay {
            if showTabBar {
                VStack {
                    Spacer()
                    TabBarCustomView(selectedItem: $viewModel.selection)
                        .frame(height: UIScreen.main.bounds.height * 0.1)
                }
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}

#Preview {
    TabBar()
}
