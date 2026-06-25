import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:control_electoral/features/veedor/presentation/bloc/mesas_bloc.dart';

class VeedorDashboardPage extends StatelessWidget {
  const VeedorDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Mesas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<MesasBloc, MesasState>(
        builder: (context, state) {
          return switch (state) {
            MesasInitial() || MesasLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            MesasLoaded(:final actas) =>
              actas.isEmpty
                  ? const Center(child: Text('No tienes mesas asignadas'))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: actas.length,
                      itemBuilder: (context, index) {
                        final acta = actas[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            title: Text('Acta ${acta.dignidad}'),
                            subtitle: Text('Estado: ${acta.sincronizado ? "Sincronizado" : "Pendiente"}'),
                            trailing: Icon(
                              acta.sincronizado ? Icons.cloud_done : Icons.cloud_off,
                              color: acta.sincronizado ? Colors.green : Colors.orange,
                            ),
                            onTap: () {},
                          ),
                        );
                      },
                    ),
            MesasError(:final message) => Center(
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
