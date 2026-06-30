import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:control_electoral/core/di/injection.dart';
import 'package:control_electoral/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:control_electoral/features/auth/presentation/pages/login_page.dart';
import 'package:control_electoral/features/auth/presentation/pages/change_password_page.dart';
import 'package:control_electoral/features/auth/presentation/pages/recovery_page.dart';
import 'package:control_electoral/features/provincial/presentation/pages/provincial_dashboard_page.dart';
import 'package:control_electoral/features/provincial/presentation/pages/create_recinto_page.dart';
import 'package:control_electoral/features/provincial/presentation/pages/create_coordinador_page.dart';
import 'package:control_electoral/features/provincial/presentation/pages/recinto_detail_page.dart';
import 'package:control_electoral/features/recinto/presentation/pages/recinto_dashboard_page.dart';
import 'package:control_electoral/features/recinto/presentation/pages/create_veedor_page.dart';
import 'package:control_electoral/features/recinto/presentation/pages/assign_veedor_page.dart';
import 'package:control_electoral/features/recinto/presentation/pages/mesa_detail_page.dart';
import 'package:control_electoral/features/veedor/presentation/pages/veedor_dashboard_page.dart';
import 'package:control_electoral/features/veedor/presentation/pages/mesa_detail_page.dart' as veedor;
import 'package:control_electoral/features/veedor/presentation/pages/register_acta_page.dart';
import 'package:control_electoral/features/veedor/domain/entities/acta_entity.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    refreshListenable: sl<ValueNotifier<int>>(),
    redirect: (context, state) {
      final authBloc = context.read<AuthBloc>();
      final authState = authBloc.state;

      final isLoginPage = state.matchedLocation == '/login';
      final isChangePasswordPage = state.matchedLocation == '/change-password';
      final isRecoveryPage = state.matchedLocation.startsWith('/recovery');
      final isSplash = state.matchedLocation == '/';

      if (authState is AuthInitial) {
        return isSplash ? null : '/';
      }

      if (authState is AuthLoading) {
        return null;
      }

      if (authState is AuthError || authState is AuthUnauthenticated) {
        if (!isLoginPage && !isRecoveryPage) {
          return '/login';
        }
        return null;
      }
      if (authState is AuthMustChangePassword && !isChangePasswordPage) {
        return '/change-password';
      }
      if (authState is AuthAuthenticated) {
        final role = authState.user.role;
        if (isLoginPage || isSplash || isChangePasswordPage) {
          return switch (role) {
            'provincial' => '/provincial',
            'recinto' => '/recinto',
            'veedor' => '/veedor',
            _ => '/login',
          };
        }
        final path = state.matchedLocation;
        if (path.startsWith('/provincial') && role != 'provincial') {
          return '/$role';
        }
        if (path.startsWith('/recinto') && role != 'recinto') {
          return '/$role';
        }
        if (path.startsWith('/veedor') && role != 'veedor') {
          return '/$role';
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (_, _) => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      ),
      GoRoute(path: '/login', builder: (_, _) => const LoginPage()),
      GoRoute(path: '/change-password', builder: (_, _) => const ChangePasswordPage()),
      GoRoute(path: '/recovery', builder: (_, _) => const RecoveryPage()),
      GoRoute(
        path: '/provincial',
        builder: (_, _) => const ProvincialDashboardPage(),
        routes: [
          GoRoute(
            path: 'create-recinto',
            builder: (_, _) => const CreateRecintoPage(),
          ),
          GoRoute(
            path: 'create-coordinador',
            builder: (_, _) => const CreateCoordinadorPage(),
          ),
          GoRoute(
            path: 'acta/:mesaId/:dignidad',
            builder: (_, state) {
              final extra = state.extra as Map<String, dynamic>?;
              return RegisterActaPage(
                mesaId: state.pathParameters['mesaId']!,
                dignidad: state.pathParameters['dignidad']!,
                acta: extra?['acta'] as ActaEntity?,
                recintoId: extra?['recintoId'] as String?,
              );
            },
          ),
          GoRoute(
            path: 'recinto/:recintoId',
            builder: (_, state) => RecintoDetailPage(
              recintoId: state.pathParameters['recintoId']!,
            ),
            routes: [
              GoRoute(
                path: 'mesa/:mesaId',
                builder: (_, state) => MesaDetailPage(
                  mesaId: state.pathParameters['mesaId']!,
                  recintoId: state.pathParameters['recintoId'],
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/recinto',
        builder: (_, _) => const RecintoDashboardPage(),
        routes: [
          GoRoute(
            path: 'create-veedor',
            builder: (_, _) => const CreateVeedorPage(),
          ),
          GoRoute(
            path: 'assign-veedor',
            builder: (_, _) => const AssignVeedorPage(),
          ),
          GoRoute(
            path: 'mesa/:mesaId',
            builder: (_, state) => MesaDetailPage(
              mesaId: state.pathParameters['mesaId']!,
            ),
          ),
          GoRoute(
            path: 'acta/:mesaId/:dignidad',
            builder: (_, state) {
              final extra = state.extra as Map<String, dynamic>?;
              return RegisterActaPage(
                mesaId: state.pathParameters['mesaId']!,
                dignidad: state.pathParameters['dignidad']!,
                acta: extra?['acta'] as ActaEntity?,
                recintoId: extra?['recintoId'] as String?,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/veedor',
        builder: (_, _) => const VeedorDashboardPage(),
        routes: [
          GoRoute(
            path: 'mesa/:mesaId',
            builder: (_, state) => veedor.VeedorMesaDetailPage(
              mesaId: state.pathParameters['mesaId']!,
            ),
          ),
          GoRoute(
            path: 'acta/:mesaId/:dignidad',
            builder: (_, state) {
              final extra = state.extra as Map<String, dynamic>?;
              return RegisterActaPage(
                mesaId: state.pathParameters['mesaId']!,
                dignidad: state.pathParameters['dignidad']!,
                acta: extra?['acta'] as ActaEntity?,
                recintoId: extra?['recintoId'] as String?,
              );
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Ruta no encontrada: ${state.matchedLocation}'),
      ),
    ),
  );
}
