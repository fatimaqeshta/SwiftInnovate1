//
//  ContentView.swift
//  Fruit App
//
//  Created by fatima qeshta on 25/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Text("Fruits are full of Vitamins")
                            .font(.title)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .padding(.top, -90)
            
            Spacer()
            
            HStack(spacing: 40) { // Adjust spacing as needed
                            VStack {
                    Text("🍎")
                        .font(.system(size: 100))
                    Text("Apples")
                                   
                }
                
                VStack {
                    Text("🍉")
                        .font(.system(size: 100))
                    Text("Water Melons")
                }
            }
            
            .padding(.bottom, 20) // Add padding between rows
                        
                        HStack(spacing: 40) { // Adjust spacing as needed
                            VStack {
                    Text("🍊")
                        .font(.system(size: 100))
                    Text("Oranges")
                }
                
                VStack {
                    Text("🍌")
                        .font(.system(size: 100))
                    Text("Banans")
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
