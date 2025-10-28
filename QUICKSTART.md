# WoWonder Native Mobile App - Quick Start Guide

## 🚀 Get Started in 5 Minutes

This guide will help you get the WoWonder mobile app running on your machine quickly.

## Prerequisites

- **Flutter SDK** 3.0+ ([Install](https://docs.flutter.dev/get-started/install))
- **Git**
- **Android Studio** (for Android) or **Xcode** (for iOS on macOS)
- **WoWonder Server** with API access

## Step 1: Clone & Setup (1 min)

```bash
# Clone the repository
git clone https://github.com/jishanalibd/wowonder-native-app.git
cd wowonder-native-app

# Install dependencies
flutter pub get
```

## Step 2: Configure API (1 min)

```bash
# Copy example configuration
cp lib/core/config/app_config.example.dart lib/core/config/app_config.dart
```

Edit `lib/core/config/app_config.dart`:

```dart
class AppConfig {
  static const String baseUrl = 'https://your-wowonder-site.com';
  static const String serverKey = 'your_server_key_here';
  // ...
}
```

**Getting Your Credentials:**
- `baseUrl`: Your WoWonder installation URL (e.g., https://demo.wowonder.com)
- `serverKey`: From WoWonder Admin Panel → Settings → Server Key

## Step 3: Run Code Generation (1 min)

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Step 4: Start Development (2 min)

```bash
# Check Flutter setup
flutter doctor

# List available devices
flutter devices

# Run the app
flutter run
```

## 🎯 What You Get

### Implemented Features
✅ Splash screen with app initialization
✅ Onboarding screens for new users
✅ User registration with validation
✅ User login with secure token storage
✅ Auto-refresh tokens
✅ Beautiful Material 3 UI
✅ Light & dark theme support
✅ Error handling & loading states

### App Flow
```
Launch → Splash → (First time? Onboarding) → Login/Register → Home
```

## 📱 Testing Credentials

If using WoWonder demo site:
- URL: https://demo.wowonder.com
- Test Login: Use demo credentials from WoWonder demo site

## 🐛 Troubleshooting

### "Cannot find app_config.dart"
```bash
cp lib/core/config/app_config.example.dart lib/core/config/app_config.dart
```

### "Build failed"
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### "No devices found"
- Start an Android emulator or iOS simulator
- Connect a physical device with debugging enabled
- Run `flutter devices` to verify

## 📚 Documentation

- **[SETUP.md](SETUP.md)** - Detailed setup instructions
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - How to contribute
- **[SUMMARY.md](SUMMARY.md)** - Implementation details
- **[PHASE1_IMPLEMENTATION.md](PHASE1_IMPLEMENTATION.md)** - Phase 1 overview

## 🎨 Customization

### Change App Theme
Edit `lib/core/config/theme.dart`:
```dart
static const Color primaryColor = Color(0xFF1877F2); // Your color
```

### Add New Screen
1. Create screen in `lib/features/[feature]/presentation/screens/`
2. Add route in `lib/core/config/routes.dart`
3. Use `context.go('/your-route')` to navigate

### Add API Endpoint
1. Add to `lib/core/api/api_endpoints.dart`
2. Create method in repository
3. Use in provider/controller

## 🚢 Building for Production

### Android APK
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

### iOS (macOS only)
```bash
flutter build ios --release
```

### Web
```bash
flutter build web
```

## 🔑 Key Features

| Feature | Status |
|---------|--------|
| Authentication | ✅ Complete |
| Splash Screen | ✅ Complete |
| Onboarding | ✅ Complete |
| Token Management | ✅ Complete |
| Theme Support | ✅ Complete |
| Error Handling | ✅ Complete |
| Form Validation | ✅ Complete |
| Secure Storage | ✅ Complete |

## 🛠 Development Tools

### Recommended VS Code Extensions
- Flutter
- Dart
- Bracket Pair Colorizer
- Error Lens

### Useful Commands
```bash
# Hot reload (during flutter run)
Press 'r'

# Hot restart
Press 'R'

# Format code
flutter format lib/

# Analyze code
flutter analyze

# Run tests
flutter test
```

## 💡 Pro Tips

1. **Code Generation**: Use watch mode during development
   ```bash
   flutter pub run build_runner watch
   ```

2. **API Logging**: Check `app_config.dart` for `enableApiLogging`

3. **Debug Mode**: Set `isDebugMode = true` for development

4. **Themes**: Toggle between light/dark in device settings

## 🤝 Need Help?

- 📖 Check the documentation files
- 🐛 [Create an issue](https://github.com/jishanalibd/wowonder-native-app/issues)
- 💬 Review existing issues and discussions

## 📊 Project Stats

- **Lines of Code**: ~8,000+
- **Features**: Authentication Module
- **Screens**: 4 (Splash, Onboarding, Login, Register)
- **Platform Support**: Android, iOS, Web
- **Dependencies**: 20+ packages

## 🎯 Next Steps

After setting up:
1. Explore the code structure
2. Read CONTRIBUTING.md for development guidelines
3. Check PHASE1_IMPLEMENTATION.md for detailed features
4. Start building Phase 2 features

## ⚡ Quick Commands Reference

```bash
# Setup
flutter pub get
cp lib/core/config/app_config.example.dart lib/core/config/app_config.dart

# Generate
flutter pub run build_runner build --delete-conflicting-outputs

# Run
flutter run

# Build
flutter build apk --release      # Android
flutter build ios --release      # iOS
flutter build web               # Web

# Test
flutter test

# Clean
flutter clean
```

---

**Ready to build something amazing? Let's go! 🚀**
