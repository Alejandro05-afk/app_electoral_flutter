import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:control_electoral/features/provincial/presentation/bloc/provincial_bloc.dart';

class ProvincialDashboardPage extends StatelessWidget {
  const ProvincialDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Provincial'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<ProvincialBloc, ProvincialState>(
        builder: (context, state) {
          return switch (state) {
            ProvincialInitial() || ProvincialLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            ProvincialLoaded(:final recintos) => ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: recintos.length + 2,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildSummaryCard(context, recintos.length);
                  }
                  if (index == 1) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Nuevo Recinto'),
                      ),
                    );
                  }
                  final recinto = recintos[index - 2];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Text(recinto.nombre),
                      subtitle: Text('${recinto.canton} - ${recinto.parroquia}'),
                      trailing: Text('${recinto.numJrv} JRV'),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ProvincialError(:final message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $message'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context.read<ProvincialBloc>().add(const LoadRecintos()),
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

  Widget _buildSummaryCard(BuildContext context, int totalRecintos) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resumen',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text('Total recintos: $totalRecintos'),
          ],
        ),
      ),
    );
  }
}
