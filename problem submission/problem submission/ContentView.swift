//
//  ContentView.swift
//  ProblemSubmission
//
//  Created by Fatima Qeshta on 27/10/2024.
//


import SwiftUI

struct Box: CustomStringConvertible, Identifiable {
    var id = UUID()  // Unique ID for each box
    var width: Int
    var height: Int
    
    var description: String {
        "Box: \(width) x \(height)"
    }
}

struct ContentView: View {
    
    @State private var numbers = [14, 20, -3, 42, 6, 8, 9, -10, -99, 14, 6]
    @State private var boxes = [Box(width: 1, height: 2)]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Numbers")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)) {
                        
                    VStack(alignment: .leading) {
                        Text("Current numbers:")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text(numbers.description)
                            .font(.body)
                            .padding(.bottom, 8)
                    }
                    
                    Button(action: filterMultiplesOfThree) {
                        Label("1A: Filter multiples of 3", systemImage: "line.3.horizontal.decrease.circle")
                    }
                    .buttonStyle(ActionButtonStyle())
                    
                    Button(action: findProduct) {
                        Label("1B: Calculate product", systemImage: "multiply.circle")
                    }
                    .buttonStyle(ActionButtonStyle())
                    
                    Button(action: sortDescending) {
                        Label("1C: Sort descending", systemImage: "arrow.up.arrow.down.circle")
                    }
                    .buttonStyle(ActionButtonStyle())
                    
                    Button("Reset", role: .destructive) {
                        numbers = [14, 20, -3, 42, 6, 8, 9, -10, -99, 14, 6]
                    }
                    .buttonStyle(ResetButtonStyle())
                }
                
                Section(header: Text("Boxes")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)) {
                        
                    VStack(alignment: .leading) {
                        Text("Current boxes:")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text(boxes.map { $0.description }.joined(separator: ", "))
                            .font(.body)
                            .padding(.bottom, 8)
                    }
                    
                    Button(action: addRandomBoxes) {
                        Label("2A: Add random boxes", systemImage: "rectangle.stack")
                    }
                    .buttonStyle(ActionButtonStyle())
                    
                    Button(action: setWidthsTo100) {
                        Label("2B: Set all widths to 100", systemImage: "arrow.right.to.line.circle")
                    }
                    .buttonStyle(ActionButtonStyle())
                    
                    Button("Reset", role: .destructive) {
                        boxes = [Box(width: 1, height: 2)]
                    }
                    .buttonStyle(ResetButtonStyle())
                }
            }
            .navigationTitle("Numbers and Boxes Editor")
            .listStyle(InsetGroupedListStyle())
        }
    }
    
    // MARK: - Actions for Numbers
    func filterMultiplesOfThree() {
        numbers = numbers.filter { $0 % 3 == 0 }
    }
    
    func findProduct() {
        numbers = [numbers.reduce(1, *)]
    }
    
    func sortDescending() {
        numbers = numbers.sorted(by: >)
    }
    
    // MARK: - Actions for Boxes
    func addRandomBoxes() {
        let newBoxes = (1...2).map { _ in
            Box(width: Int.random(in: 1...10), height: Int.random(in: 1...10))
        }
        boxes.append(contentsOf: newBoxes)
    }
    
    func setWidthsTo100() {
        for i in boxes.indices {
            boxes[i].width = 100
        }
    }
}

// MARK: - Button Styles for Consistent Design
struct ActionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body.bold())
            .foregroundColor(.blue)
            .padding(8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.blue.opacity(configuration.isPressed ? 0.2 : 0.1))
            .cornerRadius(8)
    }
}

struct ResetButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body.bold())
            .foregroundColor(.red)
            .padding(8)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.red.opacity(configuration.isPressed ? 0.2 : 0.1))
            .cornerRadius(8)
    }
}

#Preview {
    ContentView()
}
