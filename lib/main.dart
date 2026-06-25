import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:control_electoral/core/router/app_router.dart';
import 'package:control_electoral/core/theme/app_theme.dart';
import 'package:control_electoral/core/di/injection.dart';
import 'package:control_electoral/core/network/sync_service.dart';
import 'package:control_electoral/features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  sl<SyncService>().startListening();
  runApp(const ControlElectoralApp());
}

class ControlElectoralApp extends StatelessWidget {
  const ControlElectoralApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthBloc>()..add(CheckAuthStatus()),
      child: MaterialApp.router(
        title: 'Control Electoral',
        theme: AppTheme.light,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
