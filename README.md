# Flutter Dev Challenge Project

This project demonstrates several foundational Flutter and programming concepts, including:

- Manual string reversal
- Login UI with validation
- API integration and caching
- Custom animated progress bar
- Animated drawer navigation
- To-Do list with SQLite persistence

---

## 🚀 Getting Started

### 📥 1. Clone the Repository

```bash
git clone https://github.com/behail/flutter-dev-challenge.git
cd flutter-dev-challenge
```

### 📦 2. Install Dependencies

Make sure you have Flutter installed. If not, follow the [Flutter installation guide](https://docs.flutter.dev/get-started/install).

Then run:

```bash
flutter pub get
```

### ▶️ 3. Run the App

```bash
flutter run
```

> You can run on an emulator or connected device (iOS, Android, or Web).

---

## 📚 Feature Highlights

### 🔁 1. Reverse a String (Without Built-in Functions)

- File: lib/utils/reverse_string.dart
- Reverses a string using loops instead of built-in methods.

---

### 🔐 2. Login Screen

- File: lib/answers/answer_for_q2.dart
- Features:
  - Email and password input
  - Login button

---

### 🌐 3. Fetch Data from a REST API

- File: lib/answers/answer_for_q3.dart
- Use JSON data from a local files
- Mock the Dio api call
- Displays results in a ListView with loading/error states

---

### 📊 4. Custom Linear Progress Bar

- File: lib/answers/answer_for_q4.dart
- Built using CustomPainter (no LinearProgressIndicator)
- Color transitions:
  - 0–50%: red
  - 51–100%: green
- A buttons animates the progress to 100%, pause animation, reverse animation and reset to 0%

---

### 🧭 5. Animated Sidebar Menu (Drawer)

- File: lib/answers/answer_for_q5.dart
- Features:
  - Slides out with fade-in using AnimatedOpacity
  - Menu items:
    - Home
    - Settings
    - About Us
  - Navigation with drawer auto-close on item click

---

### ✅ 6. To-Do List App with SQLite

- File: lib/answers/answer_for_q6.dart
- Features:
  - Add, delete, and complete tasks
  - Tasks saved locally using sqflite
  - Persistence across app restarts

---

### 📰 7. REST API with Offline Caching

- File: lib/answers/answer_for_q7.dart
- Fetches data from https://jsonplaceholder.typicode.com/posts
- Shows CircularProgressIndicator during fetch
- Stores response using shared_preferences
- Displays cached content when offline

---

## 📁 Project Structure

```
lib/
├── main.dart
├── utils/
│   └── reverse_string.dart
├── screens/
│   ├── bottom_navbar.dart
│   ├── custom_appbar.dart
│   ├── home_screen.dart
│   ├── the_page.dart
│   └── the_home_page.dart
├── widgets/
│   ├── custom_progress_bar.dart
│   └── animated_drawer.dart
└── models/
│   └── task_model.dart
└── answers/
│   ├── answer_for_q1.dart
│   ├── answer_for_q2.dart
│   ├── answer_for_q3.dart
│   ├── answer_for_q4.dart
│   ├── answer_for_q5.dart
│   ├── answer_for_q6.dart
│   └── answer_for_q7.dart
└── helpers/
    └── db_helper.dart

```

---

## 🛠 Dependencies

Key packages used:

- dio
- go_router
- sqflite
- path_provider
- shared_preferences

Install all via:

```bash
flutter pub get
```

---
