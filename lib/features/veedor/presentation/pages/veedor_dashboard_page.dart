import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:control_electoral/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:control_electoral/features/veedor/presentation/bloc/mesas_bloc.dart';

class VeedorDashboardPage extends StatefulWidget {
  const VeedorDashboardPage({super.key});
  @override
  State<VeedorDashboardPage> createState() => _VeedorDashboardPageState();
}

class _VeedorDashboardPageState extends State<VeedorDashboardPage> {
  @override
  void initState() {
    super.initState();
    _loadMesas();
  }

  void _loadMesas() {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      context.read<MesasBloc>().add(LoadMisMesas(userId: authState.user.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Mesas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AuthBloc>().add(LogoutRequested()),
          ),
        ],
      ),
      body: BlocBuilder<MesasBloc, MesasState>(
        builder: (context, state) {
          return switch (state) {
            MesasInitial() || MesasLoading() => const Center(child: CircularProgressIndicator()),
            MesasLoaded(:final mesas) =>
              mesas.isEmpty
                  ? const Center(child: Text('No tienes mesas asignadas'))
                  : RefreshIndicator(
                      onRefresh: () async => _loadMesas(),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: mesas.length,
                        itemBuilder: (context, index) {
                          final mesa = mesas[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              leading: Icon(
                                mesa.estado == 'completo' ? Icons.check_circle : Icons.pending,
                                color: mesa.estado == 'completo' ? Colors.green : Colors.orange,
                              ),
                              title: Text('Mesa ${mesa.numeroMesa}'),
                              subtitle: Text('Estado: ${mesa.estado}'),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () async {
                                await context.push('/veedor/mesa/${mesa.id}');
                                _loadMesas();
                              },
                            ),
                          );
                        },
                      ),
                    ),
            MesasError(:final message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $message'),
                    const SizedBox(height: 16),
                    ElevatedButton(onPressed: _loadMesas, child: const Text('Reintentar')),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
