//
//  ContentView.swift
//  Jokes
//
//  Created by Fatima Qeshta on 06/12/2024.
//

import SwiftUI

// Define the Joke structure and sample data
struct Joke {
    let setup: String
    let punchline: String
}

let jokes = [
    Joke(setup: "Why don't scientists trust atoms?", punchline: "Because they make up everything!"),
    Joke(setup: "Why did the scarecrow win an award?", punchline: "Because he was outstanding in his field!"),
    Joke(setup: "Why don't skeletons fight each other?", punchline: "They don't have the guts!")
]

struct ContentView: View {
    @State private var jokeIndex = 0
    @State private var showPunchline = false
    @State private var isFeedbackPresented = false
    @State private var displaySheet = false
    @State private var positiveFeedback = true

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            // Joke Setup
            Text(jokes[jokeIndex].setup)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            // Reveal Punchline Button
            Button("What?") {
                showPunchline = true
            }
            .buttonStyle(BorderedButtonStyle())
            .shadow(radius: 10)
            
            // Punchline and Continue Button
            if showPunchline {
                Text(jokes[jokeIndex].punchline)
                    .multilineTextAlignment(.center)
                
                Button("Tap to continue") {
                    if jokeIndex < jokes.count - 1 {
                        jokeIndex += 1
                        showPunchline = false
                    } else {
                        isFeedbackPresented = true
                    }
                }
            }
            
            Spacer()
            
            // Navigation Buttons
            HStack {
                Button("Reset") {
                    resetJokes()
                }
                
                Text("|")
                
                Button("Go Back") {
                    goBack()
                }
            }
        }
        .padding(50)
        .tint(.purple)
        .alert("Did you like the jokes?", isPresented: $isFeedbackPresented) {
            Button("Yes") {
                displayFeedback(true)
            }
            Button("No", role: .destructive) {
                displayFeedback(false)
            }
        }
        .sheet(isPresented: $displaySheet) {
            FeedbackSheet
        }
    }
    
    // Reset Jokes Function
    private func resetJokes() {
        jokeIndex = 0
        showPunchline = false
    }
    
    // Go Back Function
    private func goBack() {
        if jokeIndex > 0 {
            jokeIndex -= 1
        }
        showPunchline = false
    }
    
    // Feedback Sheet Content
    private var FeedbackSheet: some View {
        VStack {
            Image(positiveFeedback ? "happy" : "sad")
            Text(positiveFeedback ? "YAY THANK YOU!!" : "Oh... now I'm sad :(")
                .font(.largeTitle)
                .bold()
        }
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
    }
    
    // Display Feedback
    private func displayFeedback(_ isPositive: Bool) {
        displaySheet = true
        positiveFeedback = isPositive
    }
}

#Preview {
    ContentView()
}
