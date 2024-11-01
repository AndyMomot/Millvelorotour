//
//  PollsView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 01.11.2024.
//

import SwiftUI

struct PollsView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Asset.background.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                NavigationView(text: "Katalog")
                
                ScrollView {
                    VStack(spacing: 24) {
                        Text("Zanim zaczniesz wybierać rower, wypełnij ankietę, aby dokonać dokładniejszego wyboru")
                            .foregroundStyle(Colors.blackCustom.swiftUIColor)
                            .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
                            .multilineTextAlignment(.center)
                            .padding(12)
                            .background(Colors.yellowCustom.swiftUIColor.opacity(0.4))
                            .cornerRadius(8, corners: .allCorners)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .stroke(Colors.yellowCustom.swiftUIColor, lineWidth: 1)
                            }
                        
                        VStack(spacing: 12) {
                            ForEach(viewModel.polls.indices, id: \.self) { index in
                                let poll = viewModel.polls[index]
                                PollView(position: index + 1, model: poll) { answer in
                                    viewModel.polls[index].finalAnswer = answer
                                }
                            }
                        }
                        
                        NextButton(title: "Obliczanie kosztu wynajmu") {
                            viewModel.handleAnswers()
                        }
                        .frame(height: 48)
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                }
                .scrollIndicators(.hidden)
            }
        }
        .navigationDestination(isPresented: $viewModel.showCatalog) {
            CatalogView()
        }
    }
}

#Preview {
    PollsView()
}
