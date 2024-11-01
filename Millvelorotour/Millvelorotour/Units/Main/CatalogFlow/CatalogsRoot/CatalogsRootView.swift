//
//  CatalogsRootView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 01.11.2024.
//

import SwiftUI

struct CatalogsRootView: View {
    @State private var showPolls = false
    
    var body: some View {
        NavigationStack {
            Group {
                if showPolls {
                    PollsView()
                } else {
                    CatalogView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        showPolls = !DefaultsService.shared.compleatedPolls
                    }
                }
            }
        }
    }
}

#Preview {
    CatalogsRootView()
}
