//
//  ContentView.swift
//  AskMe
//
//  Created by Роман on 20.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = "AskMe"
    let tabs = ["AskMe", "Random"]
    
    init (){
        UITabBar.appearance().isHidden = true
    }
    
    //MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selectedTab){
                ASKView()
                    .tag("AskMe")
    
                RandomView()
                    .tag("Random")
            }
            
            HStack{
                ForEach(tabs, id: \.self) { tab in
                    TabBarItem(tab: tab, selected: $selectedTab)
                }
            }
            .padding(5)
            .frame(maxWidth: .infinity)
            .background(.gray)
            .clipShape(Capsule())
            .padding()
            .offset(y: 20)
        }
    }
    
}

//MARK: - TabBarItem
struct TabBarItem: View{
    @State var tab: String
    @Binding var selected: String
    var body: some View{
        ZStack {
            Button(action: {
                selected = tab
                },
                   label: {
                Image(tab)
                    .resizable()
                    .frame(width: 20, height: 20)
                if selected == tab {
                    Text(tab)
                        .foregroundStyle(.black)
                }
                
            })
        }
        .opacity(selected == tab ? 1 : 0.8)
        .padding(.vertical, 10)
        .padding(.horizontal, 30)
        .background(selected == tab ? .red : .gray)
        .clipShape(Capsule())
    }
}

//MARK: - Preview
#Preview {
    ContentView()
}
