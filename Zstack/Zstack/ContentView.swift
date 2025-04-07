//
//  ContentView.swift
//  Zstack
//
//  Created by fatima qeshta on 25/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack
        struct Fruit {
            let name: String
            let imageName: String
        }
        
        let fruits = [
            Fruit(name: "Apples", imageName: "apple"),
            Fruit(name: "Water Melons", imageName: "watermelon"),
            Fruit(name: "Oranges", imageName: "orange"),
            Fruit(name: "Bananas", imageName: "banana")
        ]
        
        extension ContentView: UITableViewDataSource {
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return fruits.count
            }

            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell", for: indexPath)
                let fruit = fruits[indexPath.row]
                cell.textLabel?.text = fruit.name
                cell.imageView?.image = UIImage(named: fruit.imageName)
                return cell
            }
        }


        
        .padding()
    }
}

#Preview {
    ContentView()
}
