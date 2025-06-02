
# Faculty Manager

A modern Flutter application for managing faculty information with a beautiful, warm-toned user interface.

## Features

* Faculty Management: Add, view, edit, and manage faculty members
* Local Storage: Persistent data storage using SharedPreferences
* Modern UI: Clean, contemporary design with a warm color palette
* Responsive Design: Optimized for various screen sizes
* First Launch Detection: Smooth onboarding experience

## Design System

The app features a carefully crafted color palette that creates a warm, professional atmosphere:

* Primary Red (`#A62C2C`) - Main brand color for headers and primary actions
* Bright Red (`#E83F25`) - Secondary actions and highlights
* Warm Orange (`#EA7300`) - Floating action buttons and tertiary accents
* Golden Yellow (`#D3CA79`) - Input borders and subtle design elements

## Getting Started

### Prerequisites

* Flutter SDK (latest stable version)
* Dart SDK
* Android Studio / VS Code
* Android/iOS device or emulator

### Installation

1. Clone the repository

   ```bash
   git clone <your-repository-url>
   cd faculty-manager
   ```

2. Install dependencies

   ```bash
   flutter pub get
   ```

3. Run the application

   ```bash
   flutter run
   ```

## App Structure

```
lib/
├── main.dart                 # App entry point and theme configuration
├── local_storage.dart        # SharedPreferences utility class
└── screens/
    └── faculty_list_screen.dart  # Main faculty management screen
```

## Key Components

### LocalStorage Class

Handles all local data persistence:

* First launch detection
* Faculty name storage
* SharedPreferences management

### Theme Configuration

* Material 3 design system
* Custom color scheme implementation
* Consistent typography and spacing
* Modern rounded corners and shadows

## Dependencies

* `flutter/material.dart` - Material Design components
* `shared_preferences` - Local data storage

## Usage

1. First Launch: The app detects first-time users and can show onboarding
2. Faculty Management: Use the main screen to manage faculty information
3. Data Persistence: All data is automatically saved locally

## Customization

### Changing Colors

Update the color palette in `main.dart`:

```dart
primaryColor: Color(0xFFA62C2C),  // Change primary color
secondary: Color(0xFFE83F25),     // Change secondary color
// ... other colors
```

### Adding New Screens

1. Create new screen files in the `screens/` directory
2. Import and navigate to them from existing screens

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

If you encounter any issues or have questions:

* Create an issue in the repository
* Check Flutter documentation at [flutter.dev](https://flutter.dev)
* Review the [Flutter cookbook](https://docs.flutter.dev/cookbook) for common patterns

## Built With

* Flutter - UI framework
* Dart - Programming language
* Material Design 3 - Design system
* SharedPreferences - Local storage solution

---

Created with love using Flutter

