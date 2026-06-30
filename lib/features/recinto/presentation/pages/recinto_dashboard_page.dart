import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:control_electoral/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:control_electoral/features/recinto/presentation/bloc/recinto_bloc.dart';

class RecintoDashboardPage extends StatefulWidget {
  const RecintoDashboardPage({super.key});
  @override
  State<RecintoDashboardPage> createState() => _RecintoDashboardPageState();
}

class _RecintoDashboardPageState extends State<RecintoDashboardPage> {
  @override
  void initState() {
    super.initState();
    _loadMesas();
  }

  void _loadMesas() {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated && authState.user.recintoId != null) {
      context.read<RecintoBloc>().add(LoadMesas(recintoId: authState.user.recintoId!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    final recintoId = authState is AuthAuthenticated ? authState.user.recintoId : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Recinto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AuthBloc>().add(LogoutRequested()),
          ),
        ],
      ),
      body: recintoId == null
          ? const Center(
              child: Text('No tienes un recinto asignado. Contacta al administrador.'),
            )
          : BlocBuilder<RecintoBloc, RecintoState>(
              builder: (context, state) {
                return switch (state) {
                  RecintoInitial() || RecintoLoading() => const Center(child: CircularProgressIndicator()),
                  RecintoLoaded(:final mesas) => RefreshIndicator(
                      onRefresh: () async => _loadMesas(),
                      child: mesas.isEmpty
                          ? ListView(
                              children: const [
                                Center(child: Padding(
                                  padding: EdgeInsets.all(32),
                                  child: Text('No hay mesas en este recinto'),
                                )),
                              ],
                            )
                          : ListView(
                              padding: const EdgeInsets.all(16),
                              children: [
                                _buildSummaryCard(context, mesas),
                                const SizedBox(height: 16),
                                ...mesas.map((mesa) => Card(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: ListTile(
                                    leading: CircleAvatar(child: Text('${mesa.numeroMesa}')),
                                    title: Text('Mesa ${mesa.numeroMesa}'),
                                    subtitle: Text('Estado: ${mesa.estado}'),
                                    trailing: Icon(
                                      mesa.estado == 'completo' ? Icons.check_circle : Icons.pending,
                                      color: mesa.estado == 'completo' ? Colors.green : Colors.orange,
                                    ),
                                    onTap: () async {
                                      await context.push('/recinto/mesa/${mesa.id}');
                                      _loadMesas();
                                    },
                                  ),
                                )),
                              ],
                            ),
                    ),
                  RecintoError(:final message) => Center(
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
      floatingActionButton: recintoId != null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton.small(
                  heroTag: 'create_veedor',
                  onPressed: () async {
                    await context.push('/recinto/create-veedor');
                    _loadMesas();
                  },
                  child: const Icon(Icons.person_add),
                ),
                const SizedBox(height: 8),
                FloatingActionButton.small(
                  heroTag: 'assign_veedor',
                  onPressed: () async {
                    await context.push('/recinto/assign-veedor');
                    _loadMesas();
                  },
                  child: const Icon(Icons.assignment_ind),
                ),
              ],
            )
          : null,
    );
  }

  Widget _buildSummaryCard(BuildContext context, List mesas) {
    final total = mesas.length;
    final completas = mesas.where((m) => m.estado == 'completo').length;
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resumen', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('Total mesas: $total'),
            Text('Completas: $completas'),
            Text('Pendientes: ${total - completas}'),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: total > 0 ? completas / total : 0,
              backgroundColor: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
