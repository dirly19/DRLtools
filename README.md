# flutter_app

A new Flutter project.

## Getting Started

### Prerequisites

- Flutter SDK >= 3.3.0 ([Install Flutter](https://docs.flutter.dev/get-started/install))
- Android Studio / Xcode for platform SDKs

### Setup

```bash
# Get dependencies
flutter pub get

# Run on connected device or emulator
flutter run

# Build APK (Android)
flutter build apk --release

# Build IPA (iOS) — requires macOS + Xcode
flutter build ipa --release
```

## Dependencies

| Package | Purpose |
|---|---|
| `go_router` | Declarative routing |
| `provider` | State management |
| `shared_preferences` | Local key-value storage |
| `http` | HTTP requests |
| `flutter_svg` | SVG rendering |
| `cached_network_image` | Network image caching |
| `intl` | Internationalization & date formatting |

## Project Structure

```
lib/
  main.dart         # App entry point
test/
  widget_test.dart  # Widget tests
android/            # Android platform code
ios/                # iOS platform code
pubspec.yaml        # Dependencies & metadata
```
