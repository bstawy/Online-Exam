# online_exam

Online Exam is a Flutter mobile app that helps students take online exams easily. It supports
different question types, tracks progress, and gives quick feedback for both students and teachers.

## Getting Started

This project is a starting point for a Flutter application using latest Flutter version (Flutter
3.24.3).

&nbsp;

## 📁 Project Structure
```arduino
root
└──lib
    ├── core
    │   ├── caching
    │   ├── extensions
    │   ├── networking
    │   ├── service_locator
    │   ├── theme
    │   └── utils
    └── features
        │   └── authentication
        │       ├── data
        │       │   ├── apis_manager
        │       │   ├── data_source
        │       │   ├── data_source_impl
        │       │   ├── models
        │       │   └── repos_impl
        │       ├── domain
        │       │   ├── repos
        │       │   └── use_cases
        │       └── presentation
        │           ├── login
        │           │   ├── cubit
        │           │   └── ui
        │           ├── reset_password
        │           │   ├── cubit
        │           │   └── ui
        │           ├── sign_up
        │           │   ├── cubit
        │           │   └── ui
        │           └── widgets
        └── main.dart
```

&nbsp;

## 🛠 Used Packages

```pubspec.yaml
dependencies:
  cupertino_icons: ^1.0.8
  dartz: ^0.10.1
  dio: ^5.7.0
  equatable: ^2.0.5
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.6
  flutter_screenutil: ^5.9.3
  flutter_secure_storage: ^9.2.2
  gap: ^3.0.1
  get_it: ^8.0.0
  injectable: ^2.5.0
  json_annotation: ^4.9.0
  json_serializable: ^6.8.0
  lottie: ^3.1.2
  pinput: ^5.0.0
  pretty_dio_logger: ^1.4.0
  retrofit: ^4.4.1

dev_dependencies:
  build_runner: ^2.4.13
  flutter_lints: ^4.0.0
  flutter_test:
    sdk: flutter
  injectable_generator: ^2.6.2
  retrofit_generator: ^9.1.2
```
