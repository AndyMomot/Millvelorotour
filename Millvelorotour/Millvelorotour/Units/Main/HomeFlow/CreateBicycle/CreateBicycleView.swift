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
 
                                NextButton(title: "Dodaj zdjęcie", style: .secondary(color: .white)) {
                                    viewModel.showImagePiker.toggle()
                                }
                                    .frame(height: 44)
                            }
                            
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    InputField(
                                        title: "Typ",
                                        text: $viewModel.type
                                    )
                                    Spacer()
                                    
                                    InputField(
                                        title: "Cena",
                                        text: $viewModel.price
                                    )
                                    .keyboardType(.numberPad)
                                    Spacer()
                                    
                                    InputField(
                                        title: "Stan",
                                        text: $viewModel.condition
                                    )
                                }
                                
                                HStack(alignment: .bottom, spacing: 12) {
                                    InputField(
                                        title: "Osobliwość",
                                        text: $viewModel.tag
                                    )
                                    
                                    NextButton(title: "Dodaj", style: .secondary(color: .white)) {
                                        viewModel.addTag()
                                    }
                                        .frame(width: 70, height: 44)
                                }
                                
                                if !viewModel.tags.isEmpty {
                                    ScrollView(.horizontal) {
                                        HStack(spacing: 12) {
                                            ForEach(viewModel.tags) { tag in
                                                TagView(model: tag, style: .deletable) { action in
                                                    viewModel.handleTagAction(action)
                                                }
                                            }
                                        }
                                    }
                                    .scrollIndicators(.never)
                                }
                            }
                        }
                        .padding(12)
                        .background(.white)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Colors.skyBlue.swiftUIColor, lineWidth: 1)
                        }
                        
                        NextButton(title: "Dodaj nowe rowery") {
                            viewModel.createBicycle {
                                dismiss.callAsFunction()
                            }
                        }
                        .frame(height: 48)
                        .opacity(viewModel.isValideFields ? 1 : 0.5)
                        .disabled(!viewModel.isValideFields)
                    }
                }
                .scrollIndicators(.never)
            }
            .padding(.horizontal, 16)
        }
        .sheet(isPresented: $viewModel.showImagePiker) {
            ImagePicker(selectedImage: $viewModel.image)
        }
        .hideKeyboardWhenTappedAround()
        .onChange(of: viewModel.image) { _ in
            DispatchQueue.main.async {
                withAnimation(.easeInOut(duration: 0.1)) {
                    viewModel.isValideFields = viewModel.validate()
                }
            }
        }
        .onChange(of: viewModel.type) { _ in
            DispatchQueue.main.async {
                withAnimation(.easeInOut(duration: 0.1)) {
                    viewModel.isValideFields = viewModel.validate()
                }
            }
        }
        .onChange(of: viewModel.price) { _ in
            DispatchQueue.main.async {
                withAnimation(.easeInOut(duration: 0.1)) {
                    viewModel.isValideFields = viewModel.validate()
                }
            }
        }
        .onChange(of: viewModel.condition) { _ in
            DispatchQueue.main.async {
                withAnimation(.easeInOut(duration: 0.1)) {
                    viewModel.isValideFields = viewModel.validate()
                }
            }
        }
        .onChange(of: viewModel.tags) { _ in
            DispatchQueue.main.async {
                withAnimation(.easeInOut(duration: 0.1)) {
                    viewModel.isValideFields = viewModel.validate()
                }
            }
        }
    }
}

#Preview {
    CreateBicycleView()
}
