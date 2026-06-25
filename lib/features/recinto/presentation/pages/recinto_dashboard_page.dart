import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:control_electoral/features/recinto/presentation/bloc/recinto_bloc.dart';

class RecintoDashboardPage extends StatelessWidget {
  const RecintoDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Recinto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<RecintoBloc, RecintoState>(
        builder: (context, state) {
          return switch (state) {
            RecintoInitial() || RecintoLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            RecintoLoaded(:final mesas) => ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: mesas.length,
                itemBuilder: (context, index) {
                  final mesa = mesas[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${mesa.numeroMesa}'),
                      ),
                      title: Text('Mesa ${mesa.numeroMesa}'),
                      subtitle: Text('Estado: ${mesa.estado}'),
                      trailing: Icon(
                        mesa.estado == 'completa'
                            ? Icons.check_circle
                            : Icons.pending,
                        color: mesa.estado == 'completa'
                            ? Colors.green
                            : Colors.orange,
                      ),
                      onTap: () {},
                    ),
                  );
                },
              ),
            RecintoError(:final message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $message'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
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
}
