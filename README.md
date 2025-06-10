# 📋 todo_cubit_app

A simple Flutter application built to practice the core principles of **Cubit** for state management.

## 📦 Features

- Separation of UI and business logic
- Uses **Cubit** for clean and reactive state management
- Implements a `TaskModel` with a `copyWith` constructor
- Uses `Equatable` for efficient state comparisons
- Stores tasks using `List<TaskModel>` and the Dart spread (`...`) operator
- Determines the current page state (e.g., loading, empty, populated)
- Cubit functions to manage and update the UI state dynamically

## 🧱 Technologies Used

- Flutter
- [Cubit (from Bloc package)](https://pub.dev/packages/flutter_bloc)
- [Equatable](https://pub.dev/packages/equatable)
- Dart core features (`copyWith`, spread operator `...`)

## 🛠️ Purpose

This app is built as a learning project to:

- Understand how **Cubit** works
- Apply **Equatable** to simplify equality checks in states and models
- Practice clean code with separation of concerns (UI vs. logic)
- Explore reactive UI updates based on state

This app is built as a learning project to:

- Understand how **Cubit** works
- Apply **Equatable** to simplify equality checks in states and models
- Practice clean code with separation of concerns (UI vs. logic)
- Explore reactive UI updates based on state

## 🚀 Getting Started

```bash
git clone https://github.com/yourusername/todo_cubit_app.git
cd todo_cubit_app
flutter pub get
flutter run
