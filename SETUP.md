# WoWonder Mobile App - Development Setup

## Prerequisites

Before you begin, ensure you have the following installed:

1. **Flutter SDK** (3.0 or higher)
   - Download from: https://flutter.dev/docs/get-started/install
   - Add Flutter to your PATH

2. **Dart SDK** (3.0 or higher)
   - Comes bundled with Flutter

3. **IDE** (Choose one)
   - Android Studio (recommended)
   - VS Code with Flutter extensions
   - IntelliJ IDEA

4. **Platform-specific tools**
   - **For Android:**
     - Android Studio
     - Android SDK (API 21 or higher)
     - Java Development Kit (JDK 11 or higher)
   
   - **For iOS:** (macOS only)
     - Xcode 12 or higher
     - CocoaPods

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/jishanalibd/wowonder-native-app.git
cd wowonder-native-app
```

### 2. Install Flutter Dependencies

```bash
flutter pub get
```

This will download all the packages specified in `pubspec.yaml`.

### 3. Run Code Generation

The app uses code generation for models and providers. Run:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Or use watch mode during development:

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

### 4. Configure API Settings

Copy the example configuration file and update it with your WoWonder credentials:

```bash
cp lib/core/config/app_config.example.dart lib/core/config/app_config.dart
```

Then edit `lib/core/config/app_config.dart`:

```dart
class AppConfig {
  static const String baseUrl = 'https://your-wowonder-site.com';
  static const String serverKey = 'your_server_key_here';
  // ... other config
}
```

**Important:** Never commit `app_config.dart` to version control!

### 5. Verify Setup

Check that Flutter is properly installed and configured:

```bash
flutter doctor
```

Fix any issues reported by the doctor command.

### 6. Run the App

#### On Android Emulator/Device:

```bash
flutter run
```

#### On iOS Simulator/Device (macOS only):

```bash
flutter run
```

#### On Web:

```bash
flutter run -d chrome
```

## Project Structure

```
wowonder_mobile/
├── android/              # Android native code
├── ios/                  # iOS native code
├── lib/                  # Flutter/Dart code
│   ├── core/            # Core functionality
│   │   ├── api/         # API client and endpoints
│   │   ├── config/      # App configuration
│   │   ├── models/      # Data models
│   │   ├── providers/   # State management
│   │   ├── services/    # App services
│   │   └── widgets/     # Reusable widgets
│   ├── features/        # Feature modules
│   │   └── auth/        # Authentication feature
│   └── main.dart        # App entry point
├── test/                # Unit and widget tests
├── web/                 # Web platform files
├── pubspec.yaml         # Dependencies
└── README.md           # This file
```

## Common Commands

### Development

```bash
# Get dependencies
flutter pub get

# Run app
flutter run

# Run in release mode
flutter run --release

# Run on specific device
flutter run -d <device_id>

# List available devices
flutter devices

# Run code generation
flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes (code generation)
flutter pub run build_runner watch
```

### Building

```bash
# Build APK (Android)
flutter build apk

# Build App Bundle (Android)
flutter build appbundle

# Build iOS (macOS only)
flutter build ios

# Build for Web
flutter build web
```

### Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

### Code Quality

```bash
# Analyze code
flutter analyze

# Format code
flutter format lib/

# Check for outdated packages
flutter pub outdated
```

## Troubleshooting

### Issue: "Gradle build failed"
**Solution:**
1. Check your Android SDK installation
2. Run `flutter doctor` and fix any Android-related issues
3. Try `flutter clean` and then `flutter pub get`

### Issue: "CocoaPods not installed" (iOS)
**Solution:**
```bash
sudo gem install cocoapods
cd ios
pod install
```

### Issue: "Code generation not working"
**Solution:**
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue: "Cannot find app_config.dart"
**Solution:**
Make sure you've copied the example file:
```bash
cp lib/core/config/app_config.example.dart lib/core/config/app_config.dart
```

## Getting WoWonder Credentials

1. **Server Key:**
   - Login to your WoWonder admin panel
   - Go to Settings → Server Key
   - Copy the server key

2. **Base URL:**
   - Use your WoWonder installation URL
   - Example: `https://demo.wowonder.com` or `https://yoursite.com`

## Development Workflow

1. Create a feature branch
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes

3. Run code generation if needed
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. Test your changes
   ```bash
   flutter test
   flutter analyze
   ```

5. Commit and push
   ```bash
   git add .
   git commit -m "Your commit message"
   git push origin feature/your-feature-name
   ```

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Riverpod Documentation](https://riverpod.dev/)
- [WoWonder API Documentation](https://docs.wowonder.com/)
- [Dio Package](https://pub.dev/packages/dio)
- [GoRouter Package](https://pub.dev/packages/go_router)

## Support

For issues and questions:
- Create an issue in the GitHub repository
- Check the documentation in `/docs` folder
- Review the PHASE1_IMPLEMENTATION.md for Phase 1 details

## License

This project is licensed under the MIT License.
