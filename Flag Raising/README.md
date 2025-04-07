# 🇵🇸 Flag Raising App

A patriotic SwiftUI project that allows users to raise the Palestinian flag with a tap. The app animates the flag's upward movement and displays motivational messages as the flag rises higher.

## 📲 Description

This app is a symbolic gesture of pride and support for Palestine. Users can tap a button to gradually raise the flag while seeing progress updates and motivational messages.

## 🛠 Features

- 🎌 Interactive flag raising
- 📏 Live height counter
- 💬 Motivational messages based on height milestones:
  - At 20: **"Victory!"**
  - At 30: **"Palestine, Palestine!"**
- 🔄 Reset option to hoist the flag again

## 💻 How It Works

- A `counter` variable tracks how high the flag has been raised.
- As the user taps **"Raise Flag"**, the flag (🇵🇸 emoji) moves up using `offset` and `withAnimation`.
- At different counter levels, the app displays inspirational messages.
- Once the flag reaches a certain height (over 40), a **"Hoist Again"** button appears to restart the animation.

## 📦 Tech Stack

- SwiftUI
- `@State` and `withAnimation`
- `VStack`, `HStack`, `Text`, `Button`, and layout modifiers

## ✨ Future Enhancements

- Add background music or national anthem during the flag raising
- Include fireworks or confetti at milestone heights
- Localize the messages to support Arabic and other languages

