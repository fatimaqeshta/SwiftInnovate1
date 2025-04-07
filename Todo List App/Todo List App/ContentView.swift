//
//  ContentView.swift
//  Todo List App
//
//  Created by fatima qeshta on 14/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var todos = [
        TodoItem(title: "Buy groceries", isCompleted: false),
        TodoItem(title: "Walk the dog", isCompleted: true),
        TodoItem(title: "Read a book", isCompleted: false)
    ]
    
    var incompleteCount: Int {
        todos.filter { !$0.isCompleted }.count
    }
    
    var body: some View {
        TabView {
            TodoListView(todos: $todos)
                .tabItem {
                    Label("Todos", systemImage: "checkmark.circle")
                }
                .badge(incompleteCount)
            
            NewTodoView(todos: $todos)
                .tabItem {
                    Label("Add Todo", systemImage: "plus.circle")
                }
        }
    }
}

struct TodoItem: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool
    var dueDate: Date?
}

struct TodoListView: View {
    @Binding var todos: [TodoItem]
    
    var body: some View {
        List {
            ForEach(todos.filter { !$0.isCompleted }) { todo in
                TodoRowView(todo: todo)
            }
        }
    }
}

struct TodoRowView: View {
    let todo: TodoItem
    @State private var isCompleted: Bool
    
    init(todo: TodoItem) {
        self.todo = todo
        self._isCompleted = State(initialValue: todo.isCompleted)
    }
    
    var body: some View {
        HStack {
            Text(todo.title)
            Spacer()
            Button(action: {
                withAnimation {
                    isCompleted.toggle()
                }
            }) {
                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

struct NewTodoView: View {
    @Binding var todos: [TodoItem]
    @State private var title = ""
    @State private var dueDate = Date()
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Todo Details")) {
                    TextField("Enter todo title", text: $title)
                    
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                }
                
                Button("Add Todo") {
                    if title.isEmpty {
                        showAlert = true
                    } else {
                        let newTodo = TodoItem(title: title, isCompleted: false, dueDate: dueDate)
                        todos.append(newTodo)
                        title = "" // Reset title
                    }
                }
                .alert("Title is required", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                }
            }
            .navigationTitle("New Todo")
        }
    }
}
#Preview{
    ContentView()

}
