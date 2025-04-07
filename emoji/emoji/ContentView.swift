//
//  ContentView.swift
//  Emoji Artwork
//
//  Created by YJ Soon on 13/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Problem 1: Simple Sum")
                .bold()
            Text(problem1())
            
            Text("Problem 2: L-shape Area")
                .bold()
            Text(problem2())
            
            Text("Problem 3: Last Digit of Input")
                .bold()
            Text(problem3(input: 1005))
            
            Text("Problem 4: Alice's Age")
                .bold()
            Text(problem4(boboAge: 12, x: 3, y: 2))
            
            Text("Problem 5: BMI Calculation")
                .bold()
            Text(problem5(weight: 52, height: 1.65)) // using your weight and height
        }
        .padding()
    }
    
    // Problem 1: Simple Sum
    func problem1() -> String {
        let number1 = 10
        let number2 = 20
        let sum = number1 + number2
        return "The first number is \(number1), the second number is \(number2), and their sum is \(sum)."
    }
    
    // Problem 2: L-shape Area Calculation
    func problem2() -> String {
        let width = 20
        let height = 40
        let x = 5
        let y = 6
        let area = (width * y) + ((height - y) * x)
        return "The area of the L-shape is \(area)."
    }
    
    // Problem 3: Find the Last Digit
    func problem3(input: Int) -> String {
        let lastDigit = input % 10
        return "The last digit of \(input) is \(lastDigit)."
    }
    
    // Problem 4: Alice's Age Calculation
    func problem4(boboAge: Int, x: Int, y: Int) -> String {
        let aliceAge = y * (boboAge + x) - x
        return "Alice is \(aliceAge) years old."
    }
    
    // Problem 5: BMI Calculation and Classification
    func problem5(weight: Double, height: Double) -> String {
        let bmi = weight / (height * height)
        var classification: String
        
        if bmi < 18.5 {
            classification = "Underweight"
        } else if bmi >= 18.5 && bmi <= 24.9 {
            classification = "Healthy"
        } else {
            classification = "Overweight"
        }
        
        return "Your BMI is \(bmi). You are \(classification)."
    }
}

#Preview {
    ContentView()
}

