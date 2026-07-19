# FiTech Development Setup

## Prerequisites

### Required
- Flutter SDK 3.16.0+
- Android SDK (API 21+)
- Java Development Kit 11+
- Git

### Optional
- Android Studio (recommended)
- VS Code with Flutter extensions
- Git GUI client

## Installation

### 1. Clone Repository
```bash
git clone https://github.com/ohsessential-ops/fitech-apk.git
cd fitech-apk
```

### 2. Install Dependencies
```bash
flutter clean
flutter pub get
```

### 3. Code Analysis
```bash
flutter analyze
```

### 4. Run Application
```bash
flutter run
```

### 5. Build APK

**Debug APK:**
```bash
flutter build apk --debug
```

**Release APK:**
```bash
flutter build apk --release
```

## Automated Builds

GitHub Actions automatically builds APKs on:
- Push to main branch
- Pull requests
- Manual workflow dispatch

Artifacts are uploaded to GitHub Actions tab.

## Troubleshooting

### Flutter not found
```bash
flutter doctor
flutter doctor --android-licenses
```

### Build fails
```bash
flutter clean
flutter pub cache clean
flutter pub get
```

### Android issues
```bash
# Update Android SDK
flutter run -v
```
