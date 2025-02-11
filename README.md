# Dating App

A modern dating app built with Flutter, featuring clean architecture and iOS-style design.

## Features

- 🌓 Dynamic theme switching with CupertinoAdaptiveTheme
- 🔄 Clean Architecture implementation
- 💉 Dependency Injection using GetIt
- 🌐 Dio-based network layer
- 📱 iOS-style UI components
- 💾 Repository pattern for data management
- 🎯 Provider for state management

## Project Structure
```
lib/
├── src/
│   ├── application/
│   │   └── providers/         # State management
|.  ├── common/
│   │   ├── constants/         # All constants
│   │   └── overlays/          # All overlays like toast etc
│   │   └── widget/            # All reusable widgets like textfields
│   ├── core/
│   │   ├── network/           # Network configuration
│   │   └── theme/             # Theme configuration
│   ├── data/
│   │   └── repositories/      # Data layer implementations
│   ├── domain/
│   │   ├── entities/          # Business models
│   │   └── repositories/      # Repository interfaces
│   └── presentation/
│       ├── auth/              # Authentication UI
│       └── home/              # Home screen UI
└── main.dart
```

## Setup

1. Clone the repository:
   git clone https://github.com/yourusername/dating.git

2. Install dependencies:
   flutter pub get

3. Run the app:
   flutter run


## Architecture Overview

### Service Locator
```
Uses GetIt for dependency injection:

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton<UserRepository>(
    () => RemoteUserRepository(client: sl())
  );
}
```

### Network Layer
Centralized Dio client with interceptors:
```
class DioClient {
  final Dio _dio = Dio();
  // Configuration and interceptors
}
```
### Theme Management
Adaptive theme support with Cupertino styling:
```
CupertinoAdaptiveTheme(
  light: CupertinoThemeData(...),
  dark: CupertinoThemeData(...),
  initial: AdaptiveThemeMode.dark,
  builder: (theme) => CupertinoApp(...)
)
```
### State Management
Provider implementation for user data:
```
ChangeNotifierProvider(
  create: (_) => UserProvider(
    RemoteUserRepository(client: sl<DioClient>())
  ),
  child: CupertinoApp(...)
)
```
## Key Features

### Authentication
- User registration
- Profile creation
- Input validation

### Home Screen
- Card swiper interface
- Like/Dislike functionality
- Match notifications
- Profile viewing

### Prerequisite
Before running the app, ensure that the backend server is up and running.

#### Steps to Run the Backend
Clone the backend repository and read its readme:
   ```sh
   git clone https://github.com/Badar25/dating-app-backend.git