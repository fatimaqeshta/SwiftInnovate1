//
//  ContentView.swift
//  tabapp
//
//  Created by fatima qeshta on 07/10/2024.
//

import SwiftUI

// Function to sum two numbers (Int or Double)
func sumTwoNumbers<T: Numeric>(_ number1: T, _ number2: T) {
    let sum = number1 + number2
    print("First number: \(number1), Second number: \(number2), Sum: \(sum)")
}

// Function to calculate the area of an L-shape
func calculateLShapeArea(width: Int, height: Int, cutOutWidth: Int, cutOutHeight: Int) {
    let totalArea = width * height
    let cutOutArea = cutOutWidth * cutOutHeight
    let lShapeArea = totalArea - cutOutArea
    print("The area of the L-shape is \(lShapeArea)")
}

// Function to find the last digit of an integer
func findLastDigit(of input: Int) {
    let lastDigit = input % 10
    print("The last digit is \(lastDigit)")
}

// Function to calculate Alice's age based on x years from now and y times older
func calculateAliceAge(boboAgeNow: Int, x: Int, y: Int) {
    let aliceAgeNow = y * (boboAgeNow + x) - x
    print("Alice's current age is \(aliceAgeNow) years old")
}

// Function to calculate BMI and categorize it
func calculateBMI(weight: Double, height: Double) {
    let bmi = weight / (height * height)
    print("Your BMI is \(bmi)")
    
    if bmi < 18.5 {
        print("Underweight")
    } else if bmi >= 18.5 && bmi <= 24.9 {
        print("Healthy")
    } else {
        print("Overweight")
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Problem 1: Sum Two Numbers")
                .onAppear {
                    sumTwoNumbers(10.0, 20.5)
                }
                .tabItem {
                    Label("Problem 1", systemImage: "1.circle")
                }
            
            Text("Problem 2: Calculate L-Shape Area")
                .onAppear {
                    calculateLShapeArea(width: 20, height: 40, cutOutWidth: 5, cutOutHeight: 6)
                }
                .tabItem {
                    Label("Problem 2", systemImage: "2.circle")
                }
            
            Text("Problem 3: Find Last Digit")
                .onAppear {
                    findLastDigit(of: 1005)
                    findLastDigit(of: 990202420)
                }
                .tabItem {
                    Label("Problem 3", systemImage: "3.circle")
                }
            
            Text("Problem 4: Calculate Alice's Age")
                .onAppear {
                    calculateAliceAge(boboAgeNow: 12, x: 3, y: 2)
                }
                .tabItem {
                    Label("Problem 4", systemImage: "4.circle")
                }
            
            Text("Problem 5: Calculate BMI")
                .onAppear {
                    calculateBMI(weight: 50.0, height: 1.65)
                }
                .tabItem {
                    Label("Problem 5", systemImage: "5.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
