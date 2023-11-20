//
//  RandomView.swift
//  AskMe
//
//  Created by Роман on 20.11.2023.
//

import SwiftUI

struct RandomView: View {
    //MARK: - Property
    @State private var number = ""
    @State private var result = ""
    @FocusState private var nameIsFocused: Bool
    
    //MARK: - body
    var body: some View {
        ZStack {
            Image("answerPicture")
                .resizable()
            .ignoresSafeArea()
            VStack{
                Text("Укажите колличество случайных чисел")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(10)
                    .background(.yellow)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .clipShape(Capsule())
                
                TextField("0", text: $number)
                    .borderd()
                    .background().opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 80))
                    .frame(width: 250, height: 150)
                    .keyboardType(.numberPad)
                    .focused($nameIsFocused)
                
                Button(action: {GetRandomNumber()}, label: {
                    Text("Выбрать число")
                        .font(.title)
                }).buttonStyle(.borderedProminent)
                Text(result)
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 100))
                    .bold()
                    .padding(10)
                    .background(.yellow)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .clipShape(Capsule())
                    .animation(.easeIn, value: result)
            
            }
        }.onTapGesture {
            nameIsFocused = false
        }
    }
    private func GetRandomNumber() {
        guard let limit = Int(number) else { return }
        let randomNumber = Int.random(in: 1...limit)
        result = String(randomNumber)
    }
}

#Preview {
    RandomView()
}
