//
//  ContentView.swift
//  finalproject (GuessMaster)
//
//  Created by fatima qeshta on 04/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var guess: String = ""
    @State private var randomNumber = Int.random(in: 1...100)
    @State private var resultMessage: String = ""
    @State private var remainingAttempts: Int = 5
    @State private var backgroundColor: Color = Color.white
    @State private var selectedDifficulty: String = "Easy"
    @State private var timeRemaining: Int = 60
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Guess a number between 1 and 100!")
                .font(.title)
                .padding()
                .foregroundColor(.green)
                .border(Color.orange, width: 2)
            
            Picker("Select Difficulty", selection: $selectedDifficulty) {
                Text("Easy").tag("Easy")
                Text("Medium").tag("Medium")
                Text("Hard").tag("Hard")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 20)
            .onChange(of: selectedDifficulty, perform: { value in
                adjustAttempts(for: value)
                startTimer(for: value)
            })
            
            TextField("Enter Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)

            TextField("Enter your guess", text: $guess)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
            
            Button("Guess") {
                checkGuess()
            }
            .font(.headline)
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text(resultMessage)
                .font(.title2)
                .foregroundColor(.black)
            
            Text("Remaining Attempts: \(remainingAttempts)")
                .font(.body)
                .foregroundColor(.blue)
            
            Text("Time Remaining: \(timeRemaining) seconds")
                .font(.body)
                .foregroundColor(.red)
            
            Spacer()
        }
        .padding(.top, 40)
        .background(backgroundColor)
        .animation(.easeInOut, value: backgroundColor)
        .onAppear {
            startTimer(for: selectedDifficulty)
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    func adjustAttempts(for difficulty: String) {
        switch difficulty {
        case "Easy":
            remainingAttempts = 10
            timeRemaining = 60
        case "Medium":
            remainingAttempts = 6
            timeRemaining = 30
        case "Hard":
            remainingAttempts = 3
            timeRemaining = 15
        default:
            remainingAttempts = 5
            timeRemaining = 30
        }
        resetGame()
    }
    
    func checkGuess() {
        guard let guessedNumber = Int(guess) else {
            resultMessage = "Please enter a valid number."
            return
        }
        
        remainingAttempts -= 1
        
        if abs(guessedNumber - randomNumber) <= 5 && guessedNumber != randomNumber {
            resultMessage = "Too close!"
            backgroundColor = Color.orange.opacity(0.3)
        } else if abs(guessedNumber - randomNumber) < 10 && guessedNumber != randomNumber {
            resultMessage = "Close!"
            backgroundColor = Color.yellow.opacity(0.3)
        } else if guessedNumber < randomNumber {
            resultMessage = "Too low!"
            backgroundColor = Color.red.opacity(0.3)
        } else if guessedNumber > randomNumber {
            resultMessage = "Too high!"
            backgroundColor = Color.red.opacity(0.3)
        } else {
            resultMessage = "Correct! \(name), good job"
            backgroundColor = Color.green.opacity(0.3)
        }
        
        if remainingAttempts == 0 && guessedNumber != randomNumber {
            resultMessage = "Game Over! The correct number was \(randomNumber)."
            resetGame()
        }
    }
    
    func startTimer(for difficulty: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.resultMessage = "Time's up! The correct number was \(self.randomNumber)."
                self.resetGame()
            }
        }
    }
    
    func resetGame() {
        randomNumber = Int.random(in: 1...100)
        guess = ""
        backgroundColor = Color.white
        startTimer(for: selectedDifficulty)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
