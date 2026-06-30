import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:control_electoral/features/veedor/domain/entities/acta_entity.dart';
import 'package:control_electoral/core/di/injection.dart';
import 'package:control_electoral/features/veedor/domain/usecases/get_actas_by_mesa_usecase.dart';
import 'package:control_electoral/features/auth/presentation/bloc/auth_bloc.dart';

class VeedorMesaDetailPage extends StatefulWidget {
  final String mesaId;
  const VeedorMesaDetailPage({super.key, required this.mesaId});
  @override
  State<VeedorMesaDetailPage> createState() => _VeedorMesaDetailPageState();
}

class _VeedorMesaDetailPageState extends State<VeedorMesaDetailPage> {
  List<ActaEntity> _actas = [];

  @override
  void initState() {
    super.initState();
    _loadActas();
  }

  Future<void> _loadActas() async {
    try {
      final actas = await sl<GetActasByMesaUseCase>()(widget.mesaId);
      if (mounted) setState(() => _actas = actas);
    } catch (_) {}
  }

  ActaEntity? _getActa(String dignidad) {
    try {
      return _actas.firstWhere((a) => a.dignidad == dignidad);
    } catch (_) {
      return null;
    }
  }

  String get _recintoId {
    final authState = context.read<AuthBloc>().state;
    return authState is AuthAuthenticated ? authState.user.recintoId ?? '' : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de Mesa')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mesa ${widget.mesaId}',
                      style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 8),
                    Text('Actas registradas: ${_actas.length}/2'),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(value: _actas.length / 2),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Actas', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            _buildActaButton('alcalde'),
            const SizedBox(height: 8),
            _buildActaButton('prefecto'),
          ],
        ),
      ),
    );
  }

  Widget _buildActaButton(String dignidad) {
    final acta = _getActa(dignidad);
    final registrada = acta != null;
    final label = dignidad == 'alcalde' ? 'Alcalde' : 'Prefecto';

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: registrada ? Colors.green[50] : Theme.of(context).cardColor,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                registrada ? Icons.check_circle : Icons.radio_button_unchecked,
                color: registrada ? Colors.green : Colors.grey,
                size: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Acta $label'),
                    const SizedBox(height: 4),
                    Text(registrada ? 'Registrada' : 'Pendiente'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          registrada
              ? TextButton(
                  onPressed: () => _navigateActa(dignidad, acta),
                  child: const Text('Ver / Corregir'),
                )
              : ElevatedButton(
                  onPressed: () => _navigateActa(dignidad, acta),
                  child: const Text('Registrar'),
                ),
        ],
      ),
    );
  }

  Future<void> _navigateActa(String dignidad, ActaEntity? acta) async {
    await context.push(
      '/veedor/acta/${widget.mesaId}/$dignidad',
      extra: {'recintoId': _recintoId, 'acta': acta},
    );
    _loadActas();
  }
}
