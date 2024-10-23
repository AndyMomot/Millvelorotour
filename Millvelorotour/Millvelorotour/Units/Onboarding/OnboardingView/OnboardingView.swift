//
//  OnboardingView.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 12.06.2024.
//

import SwiftUI

struct OnboardingView: View {
    var item: OnboardingView.OnboardingItem
    @Binding var currentPageIndex: Int
    
    @EnvironmentObject private var rootViewModel: RootContentView.RootContentViewModel
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            Asset.preloaderBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                HStack(spacing: 6) {
                    ForEach(0..<3) { index in
                        let isCurrent = index == currentPageIndex
                        Rectangle()
                            .foregroundStyle(Colors.darkBlue.swiftUIColor)
                            .opacity(isCurrent ? 1 : 0.2)
                            .cornerRadius(10, corners: .allCorners)
                            .frame(height: 4)
                    }
                }
                
                HStack {
                    Spacer()
                    Button {
                        viewModel.showMainFlow(rootViewModel: rootViewModel)
                    } label: {
                        Text("Skip")
                            .foregroundStyle(Colors.darkGrey.swiftUIColor)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 6)
                    }
                }
                
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                
                VStack(spacing: 12) {
                    Text(item.title)
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.semiboldItalic.swiftUIFont(size: 24))
                    
                    Text(item.text)
                        .foregroundStyle(Colors.darkGrey.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 18))
                }
                .multilineTextAlignment(.center)
                
                NextButton(title: "Kontynuacja") {
                    withAnimation {
                        currentPageIndex = item.next.rawValue
                    }
                    
                    if item == .third {
                        viewModel.showMainFlow(rootViewModel: rootViewModel)
                    }
                }
                .frame(height: 48)
                
                Button {
                    viewModel.showPrivacyPolicy.toggle()
                } label: {
                    HStack(spacing: 3) {
                        Text("Zgadzam się z")
                            .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        Text("polityką prywatności")
                            .foregroundStyle(Colors.darkBlue.swiftUIColor)
                            .underline()
                    }
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                }

                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .sheet(isPresented: $viewModel.showPrivacyPolicy) {
            SwiftUIViewWebView(url: viewModel.privacyPolicyURL)
        }
    }
}

#Preview {
    OnboardingView(item: .first, currentPageIndex: .constant(0))
}
