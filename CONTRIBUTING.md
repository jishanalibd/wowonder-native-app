# Contributing to WoWonder Mobile App

Thank you for your interest in contributing to the WoWonder Mobile App! This document provides guidelines and instructions for contributing.

## Code of Conduct

Please be respectful and constructive in your interactions with other contributors.

## How to Contribute

### Reporting Bugs

1. Check if the bug has already been reported in Issues
2. Create a new issue with:
   - Clear title
   - Detailed description
   - Steps to reproduce
   - Expected vs actual behavior
   - Screenshots if applicable
   - Device/OS information

### Suggesting Features

1. Check if the feature has already been requested
2. Create a new issue with:
   - Clear description of the feature
   - Use cases
   - Mockups/wireframes if applicable

### Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Follow the coding standards (see below)
5. Test your changes
6. Commit with clear messages
7. Push to your fork
8. Open a Pull Request

## Development Setup

See [SETUP.md](SETUP.md) for detailed setup instructions.

## Coding Standards

### Dart Style Guide

Follow the [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines:

- Use `lowerCamelCase` for variables, methods, and parameters
- Use `UpperCamelCase` for classes, enums, and typedefs
- Use `lowercase_with_underscores` for library names
- Prefer `const` over `final` where possible
- Use trailing commas for better formatting

### Code Organization

- Keep files focused on a single responsibility
- Use proper folder structure (core, features, etc.)
- Group related functionality together
- Avoid deeply nested code

### Comments

- Write self-documenting code
- Add comments for complex logic
- Use doc comments (`///`) for public APIs
- Keep comments up-to-date

### Example

```dart
/// Authenticates user with username and password.
/// 
/// Returns [AuthResponse] on success.
/// Throws [Exception] on failure.
Future<AuthResponse> login({
  required String username,
  required String password,
}) async {
  // Implementation
}
```

## Code Generation

Run code generation after modifying models:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Testing

### Running Tests

```bash
# All tests
flutter test

# Specific test
flutter test test/widget_test.dart

# With coverage
flutter test --coverage
```

### Writing Tests

- Write unit tests for business logic
- Write widget tests for UI components
- Write integration tests for critical flows
- Aim for meaningful test coverage

Example:

```dart
testWidgets('Login button should be enabled with valid input', (WidgetTester tester) async {
  await tester.pumpWidget(const LoginScreen());
  
  final usernameField = find.byType(TextField).first;
  final passwordField = find.byType(TextField).last;
  final loginButton = find.byType(ElevatedButton);
  
  await tester.enterText(usernameField, 'testuser');
  await tester.enterText(passwordField, 'password123');
  await tester.pump();
  
  expect(tester.widget<ElevatedButton>(loginButton).enabled, true);
});
```

## Git Workflow

### Commit Messages

Use conventional commits format:

```
type(scope): subject

body (optional)

footer (optional)
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Test changes
- `chore`: Build/tool changes

Example:
```
feat(auth): add password reset functionality

- Add forgot password screen
- Implement reset password API call
- Add email validation

Closes #123
```

### Branch Naming

- `feature/feature-name` - New features
- `fix/bug-description` - Bug fixes
- `docs/what-changed` - Documentation
- `refactor/what-changed` - Refactoring

## Code Review Process

1. All PRs require review before merging
2. Address review comments
3. Keep PRs focused and small
4. Update documentation if needed
5. Ensure tests pass

## Project Structure

```
lib/
├── core/           # Core functionality
│   ├── api/       # API client
│   ├── config/    # Configuration
│   ├── models/    # Shared models
│   ├── providers/ # State management
│   ├── services/  # Services
│   └── widgets/   # Reusable widgets
├── features/      # Feature modules
│   └── auth/     # Authentication
│       ├── data/
│       │   ├── models/
│       │   └── repositories/
│       └── presentation/
│           ├── screens/
│           └── widgets/
└── main.dart
```

## Feature Development

When adding a new feature:

1. Create feature folder under `lib/features/`
2. Follow the structure: data, domain, presentation
3. Add models with JSON serialization
4. Create repository for API calls
5. Add Riverpod providers
6. Build UI screens and widgets
7. Add tests
8. Update documentation

## State Management

Use Riverpod for state management:

```dart
// Provider
final userProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  return UserNotifier();
});

// Usage
final user = ref.watch(userProvider);
```

## API Integration

1. Add endpoint to `api_endpoints.dart`
2. Create model with JSON serialization
3. Add repository method
4. Use in provider/controller
5. Handle errors gracefully

## Dependencies

Before adding a new dependency:

1. Check if it's necessary
2. Verify it's maintained
3. Check license compatibility
4. Update `pubspec.yaml`
5. Run `flutter pub get`

## Release Process

1. Update version in `pubspec.yaml`
2. Update CHANGELOG.md
3. Create release tag
4. Build release artifacts
5. Test on devices
6. Publish release

## Questions?

- Check existing documentation
- Search closed issues
- Create a new issue for questions
- Join community discussions

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

Thank you for contributing! 🎉
