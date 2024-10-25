//
//  PreloaderView.swift
//  Libarorent
//
//  Created by Andrii Momot on 06.10.2024.
//

import SwiftUI
import Combine

struct PreloaderView: View {
    
    @State private var timer: Timer?
    @State private var radians = 0.0
    
    let onDidLoad = PassthroughSubject<Void, Never>()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack() {
            Asset.background.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 84) {
                Asset.preloaderLogo.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 16)
                
                CircularProgressBar(
                    progress: 0.3,
                    trackColor: Colors.grayLite.swiftUIColor,
                    progressColor: Colors.darkBlue.swiftUIColor,
                    lineWidth: 8,
                    lineCap: .round
                )
                .frame(width: 108)
                .rotationEffect(.radians(radians))
            }
        }
        .onAppear {
            startTimer()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                stopTimer()
                onDidLoad.send()
            }
        }
    }
}

private extension PreloaderView {
    func startTimer() {
        stopTimer()
        
        timer = .scheduledTimer(withTimeInterval: 0.1,
                                repeats: true, block: { timer in
            withAnimation(.easeInOut) {
                radians += 0.5
            }
        })
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    PreloaderView()
}
