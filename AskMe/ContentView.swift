//
//  ContentView.swift
//  AskMe
//
//  Created by Роман on 25.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var textAsk = ""
    @State private var textAskGet = ""
    @State private var textAnswer = "ответ"
    @FocusState private var nameIsFocused: Bool
    
    var body: some View {
        VStack(spacing: 30) {
             Image(systemName: "bell")
                .resizable()
                .frame(width: 180, height: 180)
            Text("Задай вопрос на который можно ответь ДА или НЕТ")
                .font(.title)
                .frame(height: 80)
            HStack {
                TextField("Вопрос", text: $textAsk)
                    .borderd()
                    .font(.title)
                    .focused($nameIsFocused)
                    
                Button(action: randomAnswer, label: {
                    Text("Ответ")
                        .font(.largeTitle)
                })
                .buttonStyle(.borderedProminent)
            }
            TextTitleView(text: $textAskGet)
                .frame(height: 40)
            TextTitleView(text: $textAnswer)
                .frame(height: 40)
                .foregroundColor(.red)
                .padding()
                .background(.yellow)
                .cornerRadius(20)
        }
        .padding()
    }
    private func randomAnswer() {
        nameIsFocused = false
        let answerNumber = Int.random(in: 1...3)
        textAskGet = textAsk
        textAsk = ""
        if answerNumber == 1 {
            textAnswer = "ДА"
        } else if answerNumber == 2 {
            textAnswer = "НЕТ"
        } else {
            textAnswer = "Возможно"
        }
    }
}

#Preview {
    ContentView()
}

struct TextTitleView: View {
    @Binding var text: String
    var body: some View {
        Text(text).font(.title)
    }
}

struct BorderedViewModifair: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
            )
            .shadow(color: .gray, radius: 3, x: 1, y: 2)
    }
}

extension TextField {
    func borderd() -> some View {
        modifier(BorderedViewModifair())
    }
}
