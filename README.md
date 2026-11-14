# Edit-doc-flutter

A Flutter application developed using the **MVVM (Model-View-ViewModel)** architecture.

## About the Project

This project aims to develop a document management application with user authentication, registration, settings management, and document operations.

The application uses a structured architecture to separate the user interface, data, and business logic, making the code easier to maintain and extend.

## Technologies

- Flutter
- Dart
- MVVM Architecture
- ChangeNotifier
- ListenableBuilder
- shared_preferences
- Git and GitHub
- GitHub Codespaces

## Project Structure

```text
lib/
├── models/
│   ├── usuario.dart
│   └── services/
│       ├── banco_local_service.dart
│       └── preferences_service.dart
├── viewmodels/
│   ├── auth_viewmodel.dart
│   └── documentos_viewmodel.dart
├── views/
│   ├── login_view.dart
│   ├── cadastro_view.dart
│   └── home_view.dart
├── utils/
│   └── validadores.dart
└── main.dart
```

## Features

- User registration
- User login and authentication
- Name, email, and password validation
- Duplicate email verification
- Light and dark theme preferences
- Notification settings
- Registered users listing
- Navigation between screens

## How to Run

Make sure Flutter is installed and configured.

1. Clone the repository:

```bash
git clone git clone https://github.com/Igor-flowers/edit-doc-flutter.git
```

2. Open the project directory:

```bash
cd edit-doc-flutter
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0
```

## Development Stages

- **Stage 1:** Development environment setup.
- **Stage 2:** Flutter project preparation.
- **Stage 3:** Directory organization and dependency configuration.
- **Stage 4:** Migration to the MVVM architecture.
- **Stage 5:** Document CRUD operations and local data persistence.

## Current Status

The initial migration to the MVVM architecture has been completed.

The following features have been manually tested:

- User registration
- User login
- Home screen
- Preferences
- Registered users listing

User data and preferences are currently stored temporarily in memory. Local persistence and document management are planned for the next development stage.

## Documentation

For more information about the architectural migration, see [ARQUITETURA.md](ARQUITETURA.md).

---

**Developer:** Igor Flores  
**Technology:** Flutter and Dart