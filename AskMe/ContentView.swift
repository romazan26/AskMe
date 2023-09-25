//
//  ContentView.swift
//  AskMe
//
//  Created by Роман on 25.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var textAsk = ""
    @State private var textAnswer = ""
    @FocusState private var nameIsFocused: Bool
    
    var body: some View {
        VStack {
             Image(systemName: "bell")
                .resizable()
                .frame(width: 250, height: 250)
            Text("Задай вопрос на который можно ответь ДА или НЕТ")
                .font(.title)
                .padding(.bottom, 50)
            HStack {
                TextField("Вопрос", text: $textAsk)
                    .font(.title)
                    .focused($nameIsFocused)
                Button(action: randomAnswer, label: {
                    Text("Ответ")
                        .font(.title)
                })
                .buttonStyle(.borderedProminent)
            }
            
            Text(textAnswer)
                .font(.title)
                .foregroundColor(.red)
                .background(.yellow)
                .cornerRadius(10)
        }
        .padding()
    }
    private func randomAnswer() {
        nameIsFocused = false
        let answerNumber = Int.random(in: 1...3)
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
