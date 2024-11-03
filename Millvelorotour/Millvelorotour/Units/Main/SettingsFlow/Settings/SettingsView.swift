//
//  SettingsView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 03.11.2024.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Asset.background.swiftUIImage
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    NavigationView(text: "Ustawienia")
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            SettingsButton(type: .link(title: "FAQ")) {
                                viewModel.showFAQ.toggle()
                            }
                            SettingsButton(type: .link(title: "Polityka prywatności")) {
                                viewModel.showPrivacyPolicy.toggle()
                            }
                            
                            SettingsButton(
                                type: .toggle(
                                    title: "Przypomnienie o zwrocie rowerów",
                                    isOn: viewModel.isBikeReturnReminder
                                ), isOnAction:  { isOn in
                                    viewModel.setBikeReturnReminder(flag: isOn)
                                })
                            SettingsButton(
                                type: .toggle(
                                    title: "Dźwięki powiadomień",
                                    isOn: viewModel.isNotificationSounds
                                ), isOnAction:  { isOn in
                                    viewModel.setNotificationSounds(flag: isOn)
                                })
                            
                            SettingsButton(
                                type: .value(
                                    title: "Wersja aplikacji",
                                    value: viewModel.versionCode
                                ), showUnderLine: false)
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
                    .scrollIndicators(.hidden)
                }
            }
            .onAppear {
                withAnimation {
                    viewModel.getFlags()
                }
            }
            .navigationDestination(isPresented: $viewModel.showFAQ) {
                FAQView()
            }
            .sheet(isPresented: $viewModel.showPrivacyPolicy) {
                SwiftUIViewWebView(url: viewModel.privacyPolicyURL)
            }
        }
    }
}

#Preview {
    SettingsView()
}
