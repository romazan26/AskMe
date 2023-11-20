//
//  ContentView.swift
//  AskMe
//
//  Created by Роман on 25.09.2023.
//

import SwiftUI


struct ASKView: View {
    //MARK: - Properies
    @State private var textAsk = ""
    @State private var textAskGet = ""
    @State private var textAnswer = ""
    @FocusState private var nameIsFocused: Bool
    
    //MARK: - body
    var body: some View {
        ZStack {
            Image("answerPicture")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Text("Задай вопрос на который можно ответь ДА или НЕТ")
                    .multilineTextAlignment(.center)
                    .padding(8)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .background(.opacity(0.6))
                    .cornerRadius(10)
                HStack {
                    TextField("Вопрос", text: $textAsk)
                        .borderd()
                        .font(.title)
                        .focused($nameIsFocused)
                        .foregroundColor(.white)
                    Button(action: randomAnswer, label: {
                        Text("Ответ")
                            .font(.largeTitle)
                    })
                    .buttonStyle(.borderedProminent)
                    
                }
                //MARK: - Ask
                TextTitleView(text: $textAskGet)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.opacity(0.6))
                    .cornerRadius(10)
                    .animation(.easeIn)
                    
                
                //MARK: - Answer
                TextTitleView(text: $textAnswer)
                    .foregroundColor(.red)
                    .padding()
                    .background(.yellow)
                    .cornerRadius(20)
                    .animation(.easeIn)
            }
            .padding()
            .onTapGesture {
                nameIsFocused = false
        }
        }
    }
    //MARK: - functionRandom
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
//MARK: - Preview
#Preview {
    ASKView()
}

struct TextTitleView: View {
    @Binding var text: String
    var body: some View {
        Text(text).font(.title)
            .frame(height: 40)
    }
}

struct BorderedViewModifair: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.yellow)
            )
            .shadow(color: .blue, radius: 10)
    }
}

extension TextField {
    func borderd() -> some View {
        modifier(BorderedViewModifair())
    }
}
