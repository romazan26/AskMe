//
//  yesOreNoView.swift
//  AskMe
//
//  Created by Роман on 29.11.2023.
//

import SwiftUI

struct Choice: View {
    @State private var YN = false
    @State private var rotation: Double = 180
    var body: some View {
        ZStack {
            Image("answerPicture")
                .resizable()
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("YES")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding(10)
                        .background(.green)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .clipShape(Capsule())
                    
                    Image(systemName: "arrowshape.left.fill")
                        .resizable()
                        .frame(width: 170, height: 90)
                        .rotationEffect(.degrees(YN ? 180 : 0))
                        .animation(.spring(duration: 0.5, bounce: 0.6), value: YN)
                        .foregroundStyle(.yellow)
    
                    Text("NO")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding(10)
                        .background(.red)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .clipShape(Capsule())
                }
                Button(action: {
                    MakeAChoice()
                }, label: {
                    Text("Сделать выбор")
                        .font(.largeTitle)
                    }
                )
                .buttonStyle(.borderedProminent)
                .shadow(color: .yellow, radius: 10)
                .offset(y: 120)
            }
            
        }
        
    }
    private func MakeAChoice() {
        let choice = Int.random(in: 0...1)
        if choice == 0 {
            YN = false
        } else {YN = true}
        
    }
}

#Preview {
    Choice()
}
