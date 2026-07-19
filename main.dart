import 'package:flutter/material.dart';

import 'core/diagnostics/app_error_boundary.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/auth_repository.dart';
import 'features/auth/domain/auth_session.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/dashboard/presentation/dashboard_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppErrorBoundary.install();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };
  runApp(const FiTechApp());
}

class FiTechApp extends StatefulWidget {
  const FiTechApp({super.key});

  @override
  State<FiTechApp> createState() => _FiTechAppState();
}

class _FiTechAppState extends State<FiTechApp> {
  final authRepository = AuthRepository();
  late Future<AuthSession?> restoredSession;
  AuthSession? session;

  @override
  void initState() {
    super.initState();
    restoredSession = authRepository.restoreSession();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FiTech',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: FutureBuilder<AuthSession?>(
        future: restoredSession,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          session ??= snapshot.data;
          if (session == null || session!.isExpired) {
            return LoginScreen(
              onAuthenticated: (value) {
                setState(() => session = value);
              },
            );
          }

          return DashboardScreen(
            currentUser: session!.user,
            onSignOut: () async {
              await authRepository.signOut();
              setState(() {
                session = null;
                restoredSession = Future.value(null);
              });
            },
          );
        },
      ),
    );
  }
}
