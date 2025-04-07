//
//  ContentView.swift
//  Flag Raising
//
//  Created by fatima qeshta on 19/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0.00
    @State private var message = ""
    
    func updateMessage(){
        if counter>=10{
            message = ""
        }
        if counter>=20{
            message = "Victory!"
        }
        if counter>=30{
            message = "palestine, palestine!"
        }
    }
    var body: some View {
        VStack {

            Spacer()
            Text("Height: \(Int(counter))")
            HStack(alignment:.bottom,spacing:-10){
                Rectangle().frame(width:20)
                Text("🇵🇸").font(.system(size:100)).offset(y:-10*counter)
            }
            Button{
                if counter<41{
                    withAnimation{
                        counter+=1
                        updateMessage()
                    }
                }
            } label:{
                Text("Raise Flag").font(.title2).fontWeight(.heavy)
            }.padding().background(.red).foregroundColor(.white).cornerRadius(10).shadow(color: .brown, radius: 20)
            if counter > 40{
                Button("Hoist Again", role: .destructive){
                    withAnimation{
                        counter = 0
                        message = "Flag is raised"
                    }
                }.buttonStyle(.bordered).tint(.red)
            }
            Spacer()
            Text(message)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

