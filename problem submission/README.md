# 📦 Numbers and Boxes Editor – SwiftUI App

A SwiftUI app that demonstrates interactive state management and data transformations for both numeric arrays and custom structures like `Box`.

---

## 🧩 Features

### 🔢 Numbers Section
- Displays an array of integers.
- **Filter Multiples of 3** – Filters only numbers divisible by 3.
- **Calculate Product** – Replaces the list with the product of all values.
- **Sort Descending** – Sorts numbers from largest to smallest.
- **Reset** – Restores the original array.

### 📦 Boxes Section
- Displays an array of custom `Box` structs (`width` x `height`).
- **Add Random Boxes** – Adds two randomly sized boxes.
- **Set Widths to 100** – Sets the width of all boxes to 100.
- **Reset** – Restores to the initial box.

---

## 🧪 Struct Definitions

### Box
```swift
struct Box: CustomStringConvertible, Identifiable {
    var id = UUID()
    var width: Int
    var height: Int

    var description: String {
        "Box: \(width) x \(height)"
    }
}
