import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:control_electoral/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:control_electoral/features/veedor/domain/entities/acta_entity.dart';
import 'package:control_electoral/features/veedor/domain/usecases/get_actas_by_mesa_usecase.dart';
import 'package:control_electoral/core/di/injection.dart';

class MesaDetailPage extends StatefulWidget {
  final String mesaId;
  final String? recintoId;
  const MesaDetailPage({super.key, required this.mesaId, this.recintoId});
  @override
  State<MesaDetailPage> createState() => _MesaDetailPageState();
}

class _MesaDetailPageState extends State<MesaDetailPage> {
  List<ActaEntity> _actas = [];
  bool _loading = true;
  String? _error;

  static const _dignidades = ['alcalde', 'prefecto'];

  @override
  void initState() {
    super.initState();
    _loadActas();
  }

  Future<void> _loadActas() async {
    setState(() { _loading = true; _error = null; });
    try {
      final actas = await sl<GetActasByMesaUseCase>()(widget.mesaId);
      if (mounted) setState(() => _actas = actas);
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  ActaEntity? _getActa(String dignidad) {
    try {
      return _actas.firstWhere((a) => a.dignidad == dignidad);
    } catch (_) {
      return null;
    }
  }

  String _getBaseRoute() {
    final authState = context.read<AuthBloc>().state;
    final role = authState is AuthAuthenticated ? authState.user.role : '';
    return role == 'provincial' ? '/provincial' : '/recinto';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de Mesa')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: $_error'),
                      const SizedBox(height: 16),
                      ElevatedButton(onPressed: _loadActas, child: const Text('Reintentar')),
                    ],
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
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
                            Text('Actas registradas: ${_actas.length}/${_dignidades.length}'),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: _actas.length / _dignidades.length,
                              backgroundColor: Colors.grey[300],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text('Actas', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 12),
                    ..._dignidades.map((d) => _buildActaButton(context, d)),
                    const SizedBox(height: 16),
                    if (_actas.isNotEmpty) ...[
                      const Divider(),
                      const SizedBox(height: 8),
                      Text('Detalle de actas', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 12),
                      ..._actas.map((acta) => _buildActaCard(context, acta)),
                    ],
                  ],
                ),
    );
  }

  Widget _buildActaButton(BuildContext context, String dignidad) {
    final acta = _getActa(dignidad);
    final registrada = acta != null;
    final label = dignidad == 'alcalde' ? 'Alcalde' : 'Prefecto';

    return Card(
      color: registrada ? Colors.green[50] : null,
      child: ListTile(
        leading: Icon(
          registrada ? Icons.check_circle : Icons.radio_button_unchecked,
          color: registrada ? Colors.green : Colors.grey,
          size: 32,
        ),
        title: Text('Acta $label'),
        subtitle: Text(registrada ? 'Registrada' : 'Pendiente'),
        trailing: registrada
            ? TextButton(
                onPressed: () async {
                  final recintoId = widget.recintoId ??
                      (context.read<AuthBloc>().state is AuthAuthenticated
                          ? (context.read<AuthBloc>().state as AuthAuthenticated).user.recintoId
                          : null);
                  await context.push(
                    '${_getBaseRoute()}/acta/${widget.mesaId}/$dignidad',
                    extra: {'acta': acta, 'recintoId': recintoId},
                  );
                  _loadActas();
                },
                child: const Text('Editar'),
              )
            : ElevatedButton(
                onPressed: () async {
                  final recintoId = widget.recintoId ??
                      (context.read<AuthBloc>().state is AuthAuthenticated
                          ? (context.read<AuthBloc>().state as AuthAuthenticated).user.recintoId
                          : null);
                  await context.push(
                    '${_getBaseRoute()}/acta/${widget.mesaId}/$dignidad',
                    extra: {'recintoId': recintoId},
                  );
                  _loadActas();
                },
                child: const Text('Registrar'),
              ),
      ),
    );
  }

  Widget _buildActaCard(BuildContext context, ActaEntity acta) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Acta ${acta.dignidad}',
                  style: Theme.of(context).textTheme.titleSmall),
                const Spacer(),
                Chip(
                  label: Text(acta.sincronizado ? 'Sincronizado' : 'Pendiente'),
                  backgroundColor: acta.sincronizado ? Colors.green[100] : Colors.orange[100],
                ),
              ],
            ),
            const Divider(),
            _infoRow('Total sufragantes', '${acta.totalSufragantes}'),
            _infoRow('Votos nulos', '${acta.votosNulos}'),
            _infoRow('Votos blancos', '${acta.votosBlancos}'),
            if (acta.votos.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text('Votos por candidato:', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ...acta.votos.map((v) => Padding(
                padding: const EdgeInsets.only(left: 8, top: 2),
                child: Text('Org: ${v.organizacionId} → ${v.votos}',
                  style: const TextStyle(fontSize: 12)),
              )),
            ],
            if (acta.gpsLat != null)
              _infoRow('GPS', '${acta.gpsLat!.toStringAsFixed(4)}, ${acta.gpsLng!.toStringAsFixed(4)}'),
            if (acta.fotoFileId != null)
              _infoRow('Foto', 'ID: ${acta.fotoFileId}'),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(width: 140, child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500))),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
