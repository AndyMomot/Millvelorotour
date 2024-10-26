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
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
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
                    VStack(spacing: 24) {
                        VStack(spacing: 24) {
                            VStack(spacing: 12) {
                                Button {
                                    viewModel.showImagePiker.toggle()
                                } label: {
                                    if viewModel.image == UIImage() {
                                        Asset.placeholder.swiftUIImage
                                            .resizable()
                                            .scaledToFit()
                                    } else {
                                        Image(uiImage: viewModel.image)
                                            .resizable()
                                            .scaledToFill()
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    }
                                }
 
                                NextButton(title: "Dodaj zdjęcie", style: .secondary(color: .white)) {}
                                    .frame(height: 44)
                            }
                            
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    CreateBicycleField(
                                        title: "Typ",
                                        text: $viewModel.type
                                    )
                                    Spacer()
                                    CreateBicycleField(
                                        title: "Cena",
                                        text: $viewModel.price
                                    )
                                    Spacer()
                                    CreateBicycleField(
                                        title: "Stan",
                                        text: $viewModel.condition
                                    )
                                }
                                
                                HStack(alignment: .bottom, spacing: 12) {
                                    CreateBicycleField(
                                        title: "Osobliwość",
                                        text: $viewModel.tag
                                    )
                                    
                                    NextButton(title: "Dodaj", style: .secondary(color: .white)) {
                                        viewModel.addTag()
                                    }
                                        .frame(width: 70, height: 44)
                                }
                                
                                ForEach(viewModel.tags) { tag in
                                    TagView(model: tag, style: .deletable) { action in
                                        viewModel.handleTagAction(action)
                                    }
                                }
                            }
                        }
                        .padding(12)
                        .background(.white)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Colors.skyBlue.swiftUIColor, lineWidth: 1)
                        }
                    }
                }
                .scrollIndicators(.never)
            }
            .padding(.horizontal, 16)
        }
        .sheet(isPresented: $viewModel.showImagePiker) {
            ImagePicker(selectedImage: $viewModel.image)
        }
    }
}

#Preview {
    CreateBicycleView()
}
