import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:control_electoral/features/recinto/presentation/bloc/recinto_bloc.dart';
import 'package:control_electoral/features/recinto/domain/entities/mesa_entity.dart';
import 'package:control_electoral/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:control_electoral/core/di/injection.dart';
import 'package:control_electoral/features/recinto/domain/repositories/recinto_repository.dart';

class AssignVeedorPage extends StatefulWidget {
  const AssignVeedorPage({super.key});
  @override
  State<AssignVeedorPage> createState() => _AssignVeedorPageState();
}

class _AssignVeedorPageState extends State<AssignVeedorPage> {
  String? _selectedMesaId;
  String? _selectedVeedorId;
  List<Map<String, dynamic>> _veedores = [];
  List<MesaEntity> _mesas = [];
  bool _loadingVeedores = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  String _veedorNombrePorId(String? veedorId) {
    if (veedorId == null || veedorId.isEmpty) return '';
    final v = _veedores.where((v) => v['user_id'] == veedorId).firstOrNull;
    if (v == null) return '';
    return '${v['nombres']} ${v['apellidos']}';
  }

  Future<void> _loadData() async {
    final authState = context.read<AuthBloc>().state;
    final user = authState is AuthAuthenticated ? authState.user : null;
    if (user != null && user.recintoId != null) {
      context.read<RecintoBloc>().add(LoadMesas(recintoId: user.recintoId!));
      try {
        final veedores = await sl<RecintoRepository>().getVeedores(user.recintoId!);
        if (mounted) setState(() => _veedores = veedores);
      } catch (_) {}
    }
    if (mounted) setState(() => _loadingVeedores = false);
  }

  Future<void> _submit() async {
    if (_selectedMesaId == null || _selectedVeedorId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona una mesa y un veedor'), backgroundColor: Colors.red),
      );
      return;
    }
    try {
      await sl<RecintoRepository>().assignVeedor(_selectedMesaId!, _selectedVeedorId!);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Veedor asignado exitosamente'), backgroundColor: Colors.green),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Asignar Veedor a Mesa')),
      body: BlocBuilder<RecintoBloc, RecintoState>(
        builder: (context, state) {
          if (state is RecintoLoaded) _mesas = state.mesas;
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: _selectedMesaId,
                  decoration: const InputDecoration(
                    labelText: 'Mesa',
                    prefixIcon: Icon(Icons.table_chart),
                  ),
                  items: _mesas.map((m) {
                    final actual = _veedorNombrePorId(m.veedorId);
                    final label = actual.isEmpty
                        ? 'Mesa ${m.numeroMesa} (sin veedor)'
                        : 'Mesa ${m.numeroMesa} (actual: $actual)';
                    return DropdownMenuItem<String>(value: m.id, child: Text(label));
                  }).toList(),
                  onChanged: (v) => setState(() => _selectedMesaId = v),
                ),
                const SizedBox(height: 16),
                _loadingVeedores
                    ? const Center(child: CircularProgressIndicator())
                    : DropdownButtonFormField<String>(
                        initialValue: _selectedVeedorId,
                        decoration: const InputDecoration(
                          labelText: 'Veedor',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        items: _veedores.map<DropdownMenuItem<String>>((v) {
                          final label = '${v['nombres']} ${v['apellidos']} (${v['cedula']})';
                          return DropdownMenuItem<String>(value: v['user_id'], child: Text(label));
                        }).toList(),
                        onChanged: (v) => setState(() => _selectedVeedorId = v),
                      ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Asignar Veedor'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

