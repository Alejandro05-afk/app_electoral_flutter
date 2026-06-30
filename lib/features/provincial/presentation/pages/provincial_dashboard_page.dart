import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:control_electoral/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:control_electoral/features/provincial/presentation/bloc/provincial_bloc.dart';
import 'package:control_electoral/features/provincial/domain/entities/voto_consolidado_entity.dart';

class ProvincialDashboardPage extends StatefulWidget {
  const ProvincialDashboardPage({super.key});
  @override
  State<ProvincialDashboardPage> createState() => _ProvincialDashboardPageState();
}

class _ProvincialDashboardPageState extends State<ProvincialDashboardPage> {
  @override
  void initState() {
    super.initState();
    _loadRecintos();
  }

  void _loadRecintos() {
    context.read<ProvincialBloc>().add(const LoadRecintos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Provincial'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AuthBloc>().add(LogoutRequested()),
          ),
        ],
      ),
      body: BlocBuilder<ProvincialBloc, ProvincialState>(
        builder: (context, state) {
          return switch (state) {
            ProvincialInitial() || ProvincialLoading() => const Center(child: CircularProgressIndicator()),
            ProvincialLoaded(:final recintos) => RefreshIndicator(
                onRefresh: () async => _loadRecintos(),
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildSummaryCard(context),
                    const SizedBox(height: 16),
                    _buildConsolidadoCard(context),
                    const SizedBox(height: 16),
                    if (recintos.isEmpty)
                      const Center(child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text('No hay recintos registrados'),
                      ))
                    else
                      ...recintos.map((recinto) => Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(recinto.nombre),
                          subtitle: Text('${recinto.canton} - ${recinto.parroquia} | ${recinto.numJrv} JRV'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (recinto.coordinadorId != null)
                                const Icon(Icons.person, color: Colors.green, size: 20)
                              else
                                const Icon(Icons.person_off, color: Colors.red, size: 20),
                              const SizedBox(width: 4),
                              Text(recinto.coordinadorId != null ? 'Asignado' : 'Sin coord.'),
                            ],
                          ),
                          onTap: () async {
                            await context.push('/provincial/recinto/${recinto.id}');
                            _loadRecintos();
                          },
                        ),
                      )),
                  ],
                ),
              ),
            ProvincialError(:final message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $message'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _loadRecintos(),
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              ),
          };
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: 'create_recinto',
            onPressed: () async {
              await context.push('/provincial/create-recinto');
              _loadRecintos();
            },
            child: const Icon(Icons.add_location),
          ),
          const SizedBox(height: 8),
          FloatingActionButton.small(
            heroTag: 'create_coordinador',
            onPressed: () async {
              await context.push('/provincial/create-coordinador');
              _loadRecintos();
            },
            child: const Icon(Icons.person_add),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    final state = context.read<ProvincialBloc>().state;
    if (state is! ProvincialLoaded) return const SizedBox.shrink();
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resumen', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('Total recintos: ${state.recintos.length}'),
            const SizedBox(height: 4),
            Text('Total mesas: ${state.totalMesas}'),
            const SizedBox(height: 8),
            Row(
              children: [
                _estadoBadge('Completas', state.completas, Colors.green),
                const SizedBox(width: 8),
                _estadoBadge('Parciales', state.parciales, Colors.orange),
                const SizedBox(width: 8),
                _estadoBadge('Pendientes', state.pendientes, Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConsolidadoCard(BuildContext context) {
    final state = context.read<ProvincialBloc>().state;
    if (state is! ProvincialLoaded) return const SizedBox.shrink();

    if (state.loadingConsolidado) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (state.consolidado.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: state.consolidado.map((d) => _buildDignidadSection(context, d)).toList(),
    );
  }

  Widget _buildDignidadSection(BuildContext context, ConsolidadoDignidad d) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(d.dignidad == 'alcalde' ? 'Alcalde' : 'Prefecto',
              style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            _buildGeneralTable(d.general),
            if (d.porRecinto.isNotEmpty) ...[
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 8),
              Text('Por recinto', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              ...d.porRecinto.map((r) => _buildRecintoRow(context, r)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralTable(List<VotoConsolidado> votos) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[100]),
          children: const [
            Padding(padding: EdgeInsets.all(4), child: Text('Candidato', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
            Padding(padding: EdgeInsets.all(4), child: Text('Lista', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
            Padding(padding: EdgeInsets.all(4), child: Text('Votos', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
          ],
        ),
        ...votos.map((v) => TableRow(
          children: [
            Padding(padding: const EdgeInsets.all(4), child: Text(v.candidatoNombre, style: const TextStyle(fontSize: 12))),
            Padding(padding: const EdgeInsets.all(4), child: Text('${v.numeroLista}', style: const TextStyle(fontSize: 12))),
            Padding(padding: const EdgeInsets.all(4), child: Text('${v.totalVotos}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
          ],
        )),
      ],
    );
  }

  Widget _buildRecintoRow(BuildContext context, ConsolidadoRecinto r) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(r.recintoNombre, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(height: 4),
          ...r.votos.map((v) => Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                SizedBox(width: 80, child: Text('Lista ${v.numeroLista}', style: const TextStyle(fontSize: 12))),
                Text('${v.totalVotos}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _estadoBadge(String label, int count, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color.withAlpha(25),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text('$count', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
            Text(label, style: TextStyle(fontSize: 12, color: color)),
          ],
        ),
      ),
    );
  }
}
