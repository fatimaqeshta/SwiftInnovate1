//
//  ContentView.swift
//  Counter App
//
//  Created by fatima qeshta on 19/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var cookies = 0
    @State private var message = "You're Safe"
    @AppStorage("highscore") var highScore = 0
    func updateMessage(){
        if cookies>=20{
            message = "Don't Eat Too Many Cookies"
        }
        if cookies>=30{
            message = "You Good?"
        }
        if cookies>=40{
            message = "You're Cooked"
        }
    }
    func updateHigh(){
        if cookies>highScore{
            highScore=cookies
        }
    }
    var body: some View {
        VStack {
            Text("HighScore: \(highScore    )").font(.caption)
            Spacer()
            Text("\(cookies) Cookies Eaten")
            Button{
                cookies+=1
                updateMessage()
                updateHigh()
            } label:{
                Text("+🍪").font(.largeTitle).fontWeight(.heavy)
            }.padding().background(.brown).foregroundColor(.white).cornerRadius(10).shadow(color: .brown, radius: 20)
            if cookies>0{
                Button("-🍪"){
                    cookies-=1
                    updateMessage()}.foregroundColor(.brown).buttonStyle(.bordered).font(.title2).bold()
            }
            Button("Reset to 0!", role: .destructive){
                cookies = 0
            }.buttonStyle(.bordered).tint(.red)
            Spacer()
            Text(message)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
