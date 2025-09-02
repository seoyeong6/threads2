# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter application called "thread" - a social media app similar to Threads. The app features a tab-based navigation with home feed, search, activity tracking, and user profiles. Users can create posts through a modal write sheet.

## Common Development Commands

### Flutter Commands
- `flutter run` - Run the app in development mode
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS app
- `flutter test` - Run all tests
- `flutter analyze` - Run static analysis and linting
- `flutter pub get` - Install/update dependencies
- `flutter pub upgrade` - Upgrade all dependencies
- `flutter clean` - Clean build artifacts

### Testing
- `flutter test test/widget_test.dart` - Run specific test file

## Architecture Overview

### Main App Structure
- `lib/main.dart` - App entry point with MaterialApp setup
- `lib/main_navigation.dart` - Bottom navigation controller with 5 tabs (Home, Search, Write Modal, Activity, Profile)
- Uses `Offstage` widgets for tab persistence and memory efficiency

### Screen Organization
```
lib/
├── home_screen/          # Home feed with posts
│   ├── home_screen.dart
│   └── widget/           # Home-specific components
├── search/               # Search functionality
├── activity_screen/      # Activity/notifications with TabBar
├── write_screen/         # Post creation modal
└── widget/               # Shared components
    └── nav_tab.dart      # Navigation tab component
```

### Key Dependencies
- `font_awesome_flutter` - Icons throughout the app
- `faker` - Generate mock data for development
- `cupertino_icons` - iOS-style icons

### Navigation Pattern
The app uses a custom bottom navigation with 5 tabs where the middle tab (write/pen icon) opens a modal sheet instead of navigating to a screen. This is implemented in `main_navigation.dart:46-51`.

### UI Theme
- White background (`Colors.white`)
- Material Design with custom AppBar theming
- Uses FontAwesome icons for consistent iconography

### Modal Pattern
Write functionality is implemented as a modal bottom sheet (`WriteSheet`) that takes up 80% of screen height, with keyboard-aware padding for text input.

## Development Notes

### Code Conventions
- Korean comments are used throughout the codebase
- Widget constructors use `super.key`
- State management uses basic `setState()` pattern
- No routing library - uses stack-based navigation with `Offstage`

### Testing
- Single widget test file in `test/widget_test.dart`
- Uses Flutter's standard testing framework