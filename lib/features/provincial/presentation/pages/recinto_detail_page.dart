import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:control_electoral/features/recinto/presentation/bloc/recinto_bloc.dart';
import 'package:control_electoral/features/recinto/domain/entities/mesa_entity.dart';

class RecintoDetailPage extends StatefulWidget {
  final String recintoId;
  const RecintoDetailPage({super.key, required this.recintoId});
  @override
  State<RecintoDetailPage> createState() => _RecintoDetailPageState();
}

class _RecintoDetailPageState extends State<RecintoDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<RecintoBloc>().add(LoadMesas(recintoId: widget.recintoId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del Recinto')),
      body: BlocBuilder<RecintoBloc, RecintoState>(
        builder: (context, state) {
          return switch (state) {
            RecintoInitial() || RecintoLoading() => const Center(child: CircularProgressIndicator()),
            RecintoLoaded(:final mesas) => _buildContent(context, mesas),
            RecintoError(:final message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $message'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context.read<RecintoBloc>().add(LoadMesas(recintoId: widget.recintoId)),
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<MesaEntity> mesas) {
    final total = mesas.length;
    final completas = mesas.where((m) => m.estado == 'completo').length;
    final parciales = mesas.where((m) => m.estado == 'parcial').length;
    final pendientes = mesas.where((m) => m.estado == 'pendiente').length;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Resumen de Mesas', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                _progressRow('Total JRV', total, Colors.blue),
                _progressRow('Completas', completas, Colors.green),
                _progressRow('Parciales', parciales, Colors.orange),
                _progressRow('Pendientes', pendientes, Colors.red),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: total > 0 ? completas / total : 0,
                  backgroundColor: Colors.grey[300],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text('Mesas', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
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
              await context.push('/provincial/recinto/${widget.recintoId}/mesa/${mesa.id}');
              if (!context.mounted) return;
              context.read<RecintoBloc>().add(LoadMesas(recintoId: widget.recintoId));
            },
          ),
        )),
      ],
    );
  }

  Widget _progressRow(String label, int count, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 8),
          Text('$label: $count'),
        ],
      ),
    );
  }
}

