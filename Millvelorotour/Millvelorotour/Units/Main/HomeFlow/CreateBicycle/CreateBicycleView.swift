//
//  CreateBicycleView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 25.10.2024.
//

import SwiftUI

struct CreateBicycleView: View {
    @StateObject private var viewModel = CreateBicycleViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Asset.background.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                NavigationView(text: "Nowe rowery", leftView: {
                    NavigationButton(imageName: "arrowBack") {
                        dismiss.callAsFunction()
                    }
                })
                
                ScrollView {
                    
                }
                .scrollIndicators(.never)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    CreateBicycleView()
}
