//
//  FAQView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 03.11.2024.
//

import SwiftUI

struct FAQView: View {
    @StateObject private var viewModel = ViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Asset.background.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                NavigationView(text: "FAQ", leftView: {
                    NavigationButton(imageName: "arrowBack") {
                        dismiss.callAsFunction()
                    }
                })
                .padding(.horizontal, 16)
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(viewModel.faqItems.indices, id: \.self) { index in
                            let faq = viewModel.faqItems[index]
                            FAQCell(index: index, model: faq)
                        }
                    }
                    .padding(12)
                    .background(.white)
                    .cornerRadius(8, corners: .allCorners)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .stroke(Colors.skyBlue.swiftUIColor, lineWidth: 1)
                    }
                    .padding(1)
                    .padding(.horizontal, 16)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                }
            }
        }
    }
}

#Preview {
    FAQView()
}
