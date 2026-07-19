# FiTech Flutter Project Structure

## Directory Layout

```
fitech-apk/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   ├── core/
│   │   ├── theme/
│   │   ├── database/
│   │   ├── firebase/
│   │   └── diagnostics/
│   ├── features/
│   │   ├── auth/
│   │   ├── dashboard/
│   │   ├── products/
│   │   ├── supplier/
│   │   ├── reports/
│   │   └── imports/
│   └── domain/
│       ├── models/
│       └── services/
├── test/
├── android/
├── ios/
├── web/
├── pubspec.yaml
├── analysis_options.yaml
├── .github/workflows/
│   └── flutter-apk.yml
└── README.md
```

## Project Overview

**FiTech v1.3.0** - Financial ERP for e-commerce sellers

- Financial order management
- Supplier ledger tracking
- Multi-shop support
- Report generation (PDF/Excel)
- Offline-first SQLite database
- Enterprise authentication
- Automated APK builds via GitHub Actions

## Build Status

- **Language**: Dart/Flutter
- **Min SDK**: 3.3.0
- **Target SDK**: 34 (Android)
- **Status**: Ready for compilation
