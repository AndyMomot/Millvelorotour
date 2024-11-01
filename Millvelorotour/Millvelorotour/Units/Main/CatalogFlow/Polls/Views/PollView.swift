//
//  PollView.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 01.11.2024.
//

import SwiftUI

struct PollView: View {
    var position: Int
    var model: PollModel
    
    @State private var selectedAnswer: String?
    @State private var answer = ""
    
    var onSetAnswer: (String) -> Void
    
    private var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 12), count: 2)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("\(position). \(model.name)")
                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
            
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(model.answers.indices, id: \.self) { index in
                    let poll = model.answers[index]
                    PollAnswerCell(
                        item: poll,
                        selectedAnswer: $selectedAnswer
                    )
                }
            }
            
            InputField(
                title: "Własna wersja",
                placeholder: "Własna wersja",
                text: $answer)
        }
        .padding(12)
        .background(.white)
        .cornerRadius(8, corners: .allCorners)
        .overlay {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Colors.skyBlue.swiftUIColor, lineWidth: 1)
        }
        .padding(1)
        .onChange(of: selectedAnswer) { newValue in
            answer = newValue ?? ""
        }
        .onChange(of: answer) { newValue in
            onSetAnswer(newValue)
            if answer != selectedAnswer {
                selectedAnswer = nil
            }
        }
    }
}

#Preview {
    PollView(
        position: 1,
        model: .init(name: "Pokrittya",
                     answers: [
                        .init(name: "Asfalt"),
                        .init(name: "Góry"),
                        .init(name: "Gleba")
                     ])) {_ in}
    .padding()
}
