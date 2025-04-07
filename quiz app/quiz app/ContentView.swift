//
//  ContentView.swift
//  quiz app
//
//  Created by fatima qeshta on 06/12/2024.
//

import SwiftUI

struct ContentView: View {
    var questions = [
        Question(question: "If something is 168 in, how many feet's long is it?", option1: "a. 20 ft", option2: "b. 14 ft", option3: "c. 12 ft", option4: "d. 16 ft"),
        Question(question: "Solve this algebraic equation: 5(n - 7) = 2(n + 14)", option1: "a. n = 19", option2: "b. n = 21", option3: "c. n = 18", option4: "d. n = 23"),
        Question(question: "How many fluid ounces in one gallon?", option1: "a. 158", option2: "b. 128", option3: "c. 140", option4: "d. 136"),
        Question(question: "Which is longer?", option1: "a. 1 inch", option2: "b. 1 mile", option3: "c. 1 foot", option4: "d. 1 yard"),
        Question(question: "What type of math is concerned with shapes?", option1: "a. Calculus", option2: "b. Geometry", option3: "c. Algebra", option4: "d. None"),
        Question(question: "The sum of three consecutive even numbers is 60. What is the smallest of these numbers?", option1: "a. 12", option2: "b. 18", option3: "c. 20", option4: "d. 10")
    ]
    
    @State private var showQuestion = false
    @State private var currentQuestionIndex = 0
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var score = 0
    @State private var showScore = false
    @State private var highestPercentage: Int = 0
    @State private var showSheet = false

    private let pointsPerQuestion = 5
    private let maxScore = 30

    var body: some View {
        VStack {
            if showQuestion {
                if showScore {
                    VStack {
                        Button("View Results") {
                            let percentage = calculatePercentage(score: score, maxScore: maxScore)
                            if percentage > highestPercentage {
                                highestPercentage = percentage
                            }
                            showSheet = true
                        }
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        Button("Restart Quiz") {
                            withAnimation {
                                resetQuiz(
                                    score: &score,
                                    currentQuestionIndex: &currentQuestionIndex,
                                    showScore: &showScore,
                                    showQuestion: &showQuestion)
                            }
                        }
                        .font(.title)
                        .padding()
                    }
                } else {
                    let question = questions[currentQuestionIndex]
                    
                    Text(question.question)
                        .font(.largeTitle)
                        .padding()
                        .multilineTextAlignment(.center)
                        .transition(.slide) // Add slide transition
                    HStack(alignment: .center, spacing: 10) {
                        VStack(alignment: .leading, spacing: 10) {
                            Button(question.option1) {
                                checkAnswer(isCorrect: false)
                            }
                            .padding()
                            .background(.purple)
                            .cornerRadius(8)
                            Button(question.option2) {
                                checkAnswer(isCorrect: true)
                            }
                            .padding()
                            .background(.gray)
                            .cornerRadius(8)
                        }
                        .padding()
                        .font(.title3)
                        .foregroundColor(.white)
                        VStack(alignment: .leading, spacing: 10) {
                            Button(question.option3) {
                                checkAnswer(isCorrect: false)
                            }
                            .padding()
                            .background(.blue)
                            .cornerRadius(8)
                            Button(question.option4) {
                                checkAnswer(isCorrect: false)
                            }
                            .padding()
                            .background(.pink)
                            .cornerRadius(8)
                        }
                        .padding()
                        .font(.title3)
                        .foregroundColor(.white)
                    }
                }
            } else {
                VStack {
                    Text("Math Quiz")
                        .font(.system(size: 80))
                        .bold()
                    
                    Text("Check your knowledge with this quiz!")
                        .bold()
                    
                    Button("Begin") {
                        withAnimation {
                            showQuestion = true
                        }
                    }
                    .font(.title)
                    .bold()
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    Image("Math")
                        .resizable()
                        .scaledToFit()
                        .transition(.opacity) // Fade-in effect for the image
                }
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK")) {
                    withAnimation {
                        moveToNextQuestion(
                            currentQuestionIndex: &currentQuestionIndex,
                            showScore: &showScore,
                            questionsCount: questions.count
                        )
                    }
                }
            )
        }
        .sheet(isPresented: $showSheet) {
            ResultsView(score: score, maxScore: maxScore, highestPercentage: $highestPercentage)
        }
    }
    
    func checkAnswer(isCorrect: Bool) {
        if isCorrect {
            alertTitle = "Correct"
            alertMessage = "Great job!"
            score += pointsPerQuestion
        } else {
            alertTitle = "Wrong"
            alertMessage = "Try again!"
        }
        showAlert = true
    }
    
    func moveToNextQuestion(currentQuestionIndex: inout Int, showScore: inout Bool, questionsCount: Int) {
        if currentQuestionIndex < questionsCount - 1 {
            currentQuestionIndex += 1
        } else {
            showScore = true
        }
    }
    
    func resetQuiz(score: inout Int, currentQuestionIndex: inout Int, showScore: inout Bool, showQuestion: inout Bool) {
        score = 0
        currentQuestionIndex = 0
        showScore = false
        showQuestion = false
    }
    
    func calculatePercentage(score: Int, maxScore: Int) -> Int {
        let percentage = (Double(score) / Double(maxScore) * 100).rounded()
        return Int(percentage)
    }
}

#Preview {
    ContentView()
}


import SwiftUI

struct ResultsView: View {
    let score: Int
    let maxScore: Int
    @Binding var highestPercentage: Int
    
    @State private var fadeIn = false
    @State private var scaleUp = false
    @State private var offsetY: CGFloat = 50
    
    var body: some View {
        VStack {
            Text("Quiz Results")
                .font(.largeTitle)
                .bold()
                .padding()
                .opacity(fadeIn ? 1 : 0)
                .animation(.easeInOut(duration: 1), value: fadeIn)
            
            Text("Score: \(score) / \(maxScore)")
                .font(.title)
                .padding()
                .opacity(fadeIn ? 1 : 0)
                .animation(.easeInOut(duration: 1).delay(0.3), value: fadeIn)
            
            let percentage = (Double(score) / Double(maxScore) * 100).rounded()
            Text("Percentage: \(Int(percentage))%")
                .font(.title2)
                .padding(.top, 5)
                .opacity(fadeIn ? 1 : 0)
                .animation(.easeInOut(duration: 1).delay(0.6), value: fadeIn)
            
            Text("Highest Percentage: \(highestPercentage)%")
                .font(.title2)
                .padding(.top, 5)
                .opacity(fadeIn ? 1 : 0)
                .animation(.easeInOut(duration: 1).delay(0.9), value: fadeIn)
        }
        .padding()
        .scaleEffect(scaleUp ? 1 : 0.8)
        .offset(y: offsetY)
        .onAppear {
            // Trigger animations on appear
            fadeIn = true
            withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                scaleUp = true
                offsetY = 0
            }
        }
    }
}

#Preview {
    ResultsView(score: 25, maxScore: 30, highestPercentage: .constant(90))
}



import Foundation
struct Question {
    var question: String
    var option1: String
    var option2: String
    var option3: String
    var option4: String
}
