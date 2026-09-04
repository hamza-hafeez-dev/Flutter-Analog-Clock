# ⏰ Flutter Analog Clock

A clean and simple **Analog Clock** built with Flutter and Dart.

I created this project using Flutter's **CustomPainter** to draw the clock face, tick marks, and clock hands. The clock updates in real time using **Timer.periodic**.

## 📱 Preview

![Flutter Analog Clock](Preview/Screenshot%20(88).png)

## ✨ Features

- 🕐 Real-time Analog Clock
- 🎨 Custom clock face
- 🖌️ Custom tick marks and clock hands
- ⚡ Built with `CustomPainter`
- 🔄 Real-time updates using `Timer.periodic`
- 📐 Clean and responsive UI

## 🛠️ Built With

- Flutter
- Dart
- CustomPainter
- Timer.periodic
- DateTime

## 🎯 What I Practiced

While building this project, I practiced:

- Creating custom UI with `CustomPainter`
- Drawing the clock using Canvas
- Creating custom tick marks
- Drawing hour, minute, and second hands
- Working with `DateTime`
- Updating the clock using `Timer.periodic`
- Calculating the position of clock hands
- Building a responsive Flutter UI

## ⚙️ How It Works

The clock is drawn using Flutter's **CustomPainter**.

The current time is obtained using Dart's `DateTime`, while `Timer.periodic` updates the clock every second.

```dart
Timer.periodic(
  const Duration(seconds: 1),
  (timer) {
    setState(() {
      currentTime = DateTime.now();
    });
  },
);
