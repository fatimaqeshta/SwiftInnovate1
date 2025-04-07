//
//  ContentView.swift
//  app
//
//  Created by fatima qeshta on 05/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemRed).edgesIgnoringSafeArea(.all) // الخلفية الحمراء
            
            VStack {
                HStack {
                    Text("introduction")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .frame(width: 300, height: 500)
                    .overlay(
                        VStack {
                            Image("robot_plant") // اسم الصورة يجب أن يكون في Assets
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                            
                            Text("Renewme")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.brown)
                            
                            Text("greenhouse")
                                .font(.title2)
                                .italic()
                                .foregroundColor(.brown)
                        }
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
