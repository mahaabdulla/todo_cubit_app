# 📋 todo_cubit_app

A simple Flutter application built to practice the core principles of **Cubit** for state management.

## 📦 Features

- Separation of UI and business logic
- Uses **Cubit** for clean and reactive state management
- Implements a `TaskModel` with a `copyWith` constructor
- Stores tasks using `List<TaskModel>` and the Dart spread (`...`) operator
- Determines the state of the screen (e.g., loading, empty, filled)
- Provides Cubit functions to manage state and update the UI accordingly

## 🛠️ Purpose

This app is intended as a learning project to:

- Understand Cubit's structure and flow
- Practice writing clean, testable code
- Gain hands-on experience with state transitions in Flutter

## 🚀 Getting Started

```bash
git clone https://github.com/mahaabdulla/todo_cubit_app.git
cd todo_cubit_app
flutter pub get
flutter run
