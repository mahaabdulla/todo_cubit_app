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
