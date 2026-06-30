import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:control_electoral/core/router/app_router.dart';
import 'package:control_electoral/core/theme/app_theme.dart';
import 'package:control_electoral/core/di/injection.dart';
import 'package:control_electoral/core/network/sync_service.dart';
import 'package:control_electoral/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:control_electoral/features/provincial/presentation/bloc/provincial_bloc.dart';
import 'package:control_electoral/features/recinto/presentation/bloc/recinto_bloc.dart';
import 'package:control_electoral/features/veedor/presentation/bloc/mesas_bloc.dart';
import 'package:control_electoral/features/veedor/presentation/bloc/acta_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };
  ErrorWidget.builder = (details) => Material(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Error: ${details.exception}',
          style: const TextStyle(color: Colors.red, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );

  await setupDependencies();
  sl<SyncService>().startListening();
  runApp(const ControlElectoralApp());
}

class ControlElectoralApp extends StatefulWidget {
  const ControlElectoralApp({super.key});

  @override
  State<ControlElectoralApp> createState() => _ControlElectoralAppState();
}

class _ControlElectoralAppState extends State<ControlElectoralApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    sl<SyncService>().dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      sl<SyncService>().dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<AuthBloc>()..add(CheckAuthStatus()),
        ),
        BlocProvider(create: (_) => sl<ProvincialBloc>()),
        BlocProvider(create: (_) => sl<RecintoBloc>()),
        BlocProvider(create: (_) => sl<MesasBloc>()),
        BlocProvider(create: (_) => sl<ActaBloc>()),
      ],
      child: _AuthListener(
        child: MaterialApp.router(
          title: 'Control Electoral',
          theme: AppTheme.light,
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

class _AuthListener extends StatefulWidget {
  final Widget child;
  const _AuthListener({required this.child});

  @override
  State<_AuthListener> createState() => _AuthListenerState();
}

class _AuthListenerState extends State<_AuthListener> {
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    final authBloc = context.read<AuthBloc>();
    _sub = authBloc.stream.listen((_) {
      sl<ValueNotifier<int>>().value++;
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
