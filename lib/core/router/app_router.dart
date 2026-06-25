import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:control_electoral/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:control_electoral/features/auth/presentation/pages/login_page.dart';
import 'package:control_electoral/features/auth/presentation/pages/change_password_page.dart';
import 'package:control_electoral/features/provincial/presentation/pages/provincial_dashboard_page.dart';
import 'package:control_electoral/features/recinto/presentation/pages/recinto_dashboard_page.dart';
import 'package:control_electoral/features/veedor/presentation/pages/veedor_dashboard_page.dart';

class AppRouter {
  static final router = GoRouter(
    refreshListenable: null,
    redirect: (context, state) {
      final authBloc = context.read<AuthBloc>();
      final authState = authBloc.state;

      final isLoginPage = state.matchedLocation == '/login';
      final isChangePasswordPage = state.matchedLocation == '/change-password';

      if (authState is AuthUnauthenticated && !isLoginPage) {
        return '/login';
      }
      if (authState is AuthMustChangePassword && !isChangePasswordPage) {
        return '/change-password';
      }
      if (authState is AuthAuthenticated && isLoginPage) {
        return switch (authState.user.role) {
          'provincial' => '/provincial',
          'recinto' => '/recinto',
          'veedor' => '/veedor',
          _ => '/login',
        };
      }
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (_, _) => const LoginPage()),
      GoRoute(path: '/change-password', builder: (_, _) => const ChangePasswordPage()),
      GoRoute(path: '/provincial', builder: (_, _) => const ProvincialDashboardPage()),
      GoRoute(path: '/recinto', builder: (_, _) => const RecintoDashboardPage()),
      GoRoute(path: '/veedor', builder: (_, _) => const VeedorDashboardPage()),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Ruta no encontrada: ${state.matchedLocation}'),
      ),
    ),
  );
}
