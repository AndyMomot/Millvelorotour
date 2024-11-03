//
//  SettingsViewModel.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 03.11.2024.
//

import Foundation

extension SettingsView {
    final class ViewModel: ObservableObject {
        
        
        @Published var showFAQ = false
        @Published var isBikeReturnReminder = false
        @Published var isNotificationSounds = false
        @Published var showPrivacyPolicy = false
        
        let privacyPolicyURL = URL(string: "https://millvelorotour.info/")
        let versionCode = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
        
        func getFlags() {
            DispatchQueue.global().async { [weak self] in
                guard let self else { return }
                let isBikeReturnReminder = DefaultsService.shared.isBikeReturnReminder
                let isNotificationSounds = DefaultsService.shared.isNotificationSounds
                
                DispatchQueue.main.async { [self] in
                    self.isBikeReturnReminder = isBikeReturnReminder
                    self.isNotificationSounds = isNotificationSounds
                }
            }
        }
        
        func setBikeReturnReminder(flag: Bool) {
            DispatchQueue.global().async { [weak self] in
                guard let self else { return }
                DefaultsService.shared.isBikeReturnReminder = flag
                
                self.getFlags()
            }
        }
        
        func setNotificationSounds(flag: Bool) {
            DispatchQueue.global().async { [weak self] in
                guard let self else { return }
                DefaultsService.shared.isNotificationSounds = flag
                
                self.getFlags()
            }
        }
    }
}
