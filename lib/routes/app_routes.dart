import 'package:flutter_dev_test/routes/routes.dart';
import 'package:flutter_dev_test/screens/login/view/login_screen.dart';
import 'package:flutter_dev_test/screens/recovery_secret/view/recovery_secret_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: Routes.login,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.recoverySecret,
      builder: (context, state) => const RecoverySecretScreen(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
  redirect: (context, state) async {
    // final token = await storage.get('token');
    // if (user == null) {
    //   await LoginRepository().checkUserSession();
    // }
    // if (token == null || token.isEmpty) return Routes.login;
    // if (state.fullPath == Routes.login && user != null) {
    //   return Routes.home;
    // }

    return null;
  },
);
