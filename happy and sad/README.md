# 😂 Joke Time – SwiftUI Fun App

A lighthearted iOS app made with **SwiftUI**, where users read hilarious jokes, reveal punchlines, and give feedback. It’s simple, fun, and great for lifting the mood!

---

## 🎭 Features

- 🧠 Displays one joke at a time
- 😆 Tap to reveal the punchline
- 🔁 Reset or go back to previous jokes
- 🙋‍♀️ Asks for user feedback at the end
- 📄 Custom feedback sheet (happy/sad) with personalized images
- ✨ Beautiful styling with shadows, spacing, and sheet presentation

---

## 📦 Technologies Used

- **Swift 5**
- **SwiftUI**
- **State management using `@State`**
- `.alert` and `.sheet` presentation
- `.presentationDetents` for smooth bottom sheet UI

---

## 🧪 How It Works

1. App shows the joke setup (`setup`).
2. Tap **"What?"** to reveal the punchline (`punchline`).
3. Tap **"Tap to continue"** to go to the next joke.
4. When all jokes are shown, an **alert** asks for feedback.
5. Depending on the response, a **sheet** appears with either a happy or sad emoji/image and a message.

---

## 🗃 Data Structure

```swift
struct Joke {
    let setup: String
    let punchline: String
}
