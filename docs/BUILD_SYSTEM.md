# FiTech Build System

## GitHub Actions Workflow

Automated APK builds run on every commit to main.

### Workflow File
- Location: `.github/workflows/flutter-apk.yml`
- Trigger: Push to main, Pull requests, Manual dispatch
- Runner: Ubuntu latest
- Java: 11
- Flutter: 3.16.0 stable

### Build Steps
1. Checkout code
2. Setup Java JDK 11
3. Setup Flutter SDK
4. Download dependencies (`flutter pub get`)
5. Run analyzer (`flutter analyze`)
6. Build debug APK
7. Build release APK
8. Upload artifacts

### Artifacts

**Debug APK:**
- Location: `build/app/outputs/flutter-apk/app-debug.apk`
- Size: ~50MB typical
- Installation: Direct to device

**Release APK:**
- Location: `build/app/outputs/flutter-apk/app-release.apk`
- Size: ~40MB typical
- Installation: Play Store or direct

### Download Artifacts

1. Go to GitHub Actions tab
2. Select latest workflow run
3. Download APK from artifacts section
4. Install on Android device

## Local Build

```bash
# Clean previous builds
flutter clean

# Get dependencies
flutter pub get

# Run analyzer
flutter analyze

# Build debug APK
flutter build apk --debug
# Output: build/app/outputs/flutter-apk/app-debug.apk

# Build release APK (requires signing keystore)
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

## Release Build Configuration

For production release APK:

1. Generate signing keystore
2. Configure `android/key.properties`
3. Update `android/app/build.gradle` with signing config
4. Run release build

## Performance

- Build time: 5-10 minutes
- Parallel jobs: Single runner
- Caching: Implemented for dependencies
