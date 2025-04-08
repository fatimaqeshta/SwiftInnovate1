# 🧮 SwiftUI Math Problem Solver App

This app is a simple SwiftUI-based application that solves a variety of math problems using Swift functions. Each problem is displayed in a separate tab, with automatic calculation when the tab is opened.

## 📱 Features

- 🔢 Sum two numbers (Int or Double)
- 🧩 Calculate the area of an L-shape
- 🔍 Find the last digit of an integer
- 👧👦 Calculate Alice's age based on Bobo's age and a math relation
- ⚖️ Calculate and categorize Body Mass Index (BMI)

## 🧩 How It Works

- The app uses **`TabView`** to switch between problems.
- Each tab displays a `Text` with the problem title.
- When a tab appears, the corresponding function runs and prints the result to the Xcode console.

## 🛠️ Technologies Used

- **Swift**
- **SwiftUI**
- Generics (for handling different numeric types)
- Conditional logic
- Tab navigation

## 📂 Functions Overview

- `sumTwoNumbers(number1:number2:)`: Adds two numbers of any numeric type (Int or Double).
- `calculateLShapeArea(width:height:cutOutWidth:cutOutHeight:)`: Calculates the area of an L-shaped figure.
- `findLastDigit(of:)`: Extracts and prints the last digit of a given integer.
- `calculateAliceAge(boboAgeNow:x:y:)`: Calculates Alice’s age from Bobo’s age using a simple equation.
- `calculateBMI(weight:height:)`: Computes the BMI and categorizes it as Underweight, Healthy, or Overweight.

## 🔍 Output

Since this app is console-based:
- All results are printed using `print()` to the **Xcode debug console** when each tab appears.

## 📦 Project Structure

- `ContentView.swift` – Contains all logic and UI structure.

## 💡 Future Improvements

- Display results directly in the UI instead of the console.
- Let users input their own values using `TextField` and `@State`.
- Use a `List` or `NavigationStack` for better organization.

## 👩‍💻 Developed By

**Fatima Abdul Hameed**  
SwiftUI Developer | Student | Coding Enthusiast
