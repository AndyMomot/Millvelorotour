//
//  TabBarViewModel.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 13.06.2024.
//

import Foundation

extension TabBar {
    final class TabBarViewModel: ObservableObject {
        @Published var selection = TabBarSelectionView.bicycles.rawValue
    }
}

extension TabBar {
    enum TabBarSelectionView: Int {
        case bicycles = 0
        case rentals
        case catalog
        case settings
    }
    
    struct Item: Identifiable {
        private(set) var id = UUID()
        var imageName: String
        var title: String
    }
}
