# Assets Directory

This directory contains all static assets for the WoWonder mobile app.

## Structure

- `images/` - App images, logos, and graphics
- `icons/` - Icon files
- `lottie/` - Lottie animation files

## Usage

Assets are referenced in `pubspec.yaml` and can be used in the app with:

```dart
Image.asset('assets/images/logo.png')
```

## Adding Assets

1. Place your asset files in the appropriate directory
2. Make sure they're listed in `pubspec.yaml` under the `assets:` section
3. Run `flutter pub get` to register the new assets
