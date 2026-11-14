Document Editor
A Flutter application developed as part of a practical software development assignment, using the MVVM (Model-View-ViewModel) architecture.
About the Project
The project aims to develop an application with user authentication, registration, settings management, and, in future development stages, document management.
The application follows a structured architecture that separates the user interface, data, and business logic, making the code easier to maintain and extend.
Technologies
Flutter – User interface and application development.
Dart – Programming language.
ChangeNotifier – State management.
ListenableBuilder – Reactive UI updates.
shared_preferences – Local persistence dependency.
Git and GitHub – Version control and source code hosting.
GitHub Codespaces – Development environment.
Project Architecture
The project follows the MVVM architectural pattern:
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
Implemented Features
User login.
User registration.
Name, email, and password validation.
Duplicate email verification.
User authentication.
Light and dark theme preferences.
Notification settings.
Registered users listing.
Navigation between application screens.
How to Run
Make sure Flutter is installed and configured.
Clone the repository:
git clone https://github.com/Kevy06/edit-doc-flutter.git

Navigate to the project directory:
cd edit-doc-flutter

Install dependencies:
flutter pub get

Run the application in the browser:
flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0
Development Stages
Stage 1: Development environment setup and initial project structure.
Stage 2: Flutter project preparation.
Stage 3: Directory organization and dependency configuration.
Stage 4: Migration to the MVVM architecture.
Stage 5: Document CRUD implementation and local data persistence.
Current Status
The initial migration to the MVVM architecture has been completed. Manual tests were performed for registration, login, preferences, and registered users listing.
User data and preferences are currently stored temporarily in memory. Local persistence and document management are planned for the next development stage.
Documentation
For more details about the architectural migration, see ARQUITETURA.md.

Project: Document Editor
Developer: Igor Flores
Main Technology: Flutter


