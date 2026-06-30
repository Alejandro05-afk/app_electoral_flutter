import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:control_electoral/features/provincial/presentation/bloc/provincial_bloc.dart';
import 'package:control_electoral/features/provincial/domain/entities/recinto_entity.dart';
import 'package:control_electoral/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:control_electoral/core/di/injection.dart';
import 'package:control_electoral/core/utils/validators.dart';
import 'package:control_electoral/features/provincial/domain/repositories/provincial_repository.dart';

class CreateCoordinadorPage extends StatefulWidget {
  const CreateCoordinadorPage({super.key});
  @override
  State<CreateCoordinadorPage> createState() => _CreateCoordinadorPageState();
}

class _CreateCoordinadorPageState extends State<CreateCoordinadorPage> {
  final _formKey = GlobalKey<FormState>();
  final _cedulaCtrl = TextEditingController();
  final _nombresCtrl = TextEditingController();
  final _apellidosCtrl = TextEditingController();
  final _telefonoCtrl = TextEditingController();
  String? _selectedRecintoId;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    context.read<ProvincialBloc>().add(const LoadRecintos());
  }

  @override
  void dispose() {
    _cedulaCtrl.dispose();
    _nombresCtrl.dispose();
    _apellidosCtrl.dispose();
    _telefonoCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedRecintoId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona un recinto'), backgroundColor: Colors.red),
      );
      return;
    }
    setState(() => _loading = true);
    try {
      final authState = context.read<AuthBloc>().state;
      final userId = authState is AuthAuthenticated ? authState.user.id : '';
      await sl<ProvincialRepository>().createCoordinador(
        cedula: _cedulaCtrl.text.trim(),
        nombres: _nombresCtrl.text.trim(),
        apellidos: _apellidosCtrl.text.trim(),
        telefono: _telefonoCtrl.text.trim(),
        recintoId: _selectedRecintoId!,
        createdBy: userId,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Coordinador creado exitosamente'), backgroundColor: Colors.green),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Coordinador de Recinto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _cedulaCtrl,
                decoration: const InputDecoration(
                  labelText: 'Cédula',
                  prefixIcon: Icon(Icons.badge_outlined),
                ),
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Requerido';
                  if (!isValidCedula(v.trim())) return 'Cédula inválida';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nombresCtrl,
                decoration: const InputDecoration(
                  labelText: 'Nombres',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (v) => v == null || v.trim().isEmpty ? 'Requerido' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _apellidosCtrl,
                decoration: const InputDecoration(
                  labelText: 'Apellidos',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (v) => v == null || v.trim().isEmpty ? 'Requerido' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _telefonoCtrl,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                keyboardType: TextInputType.phone,
                validator: (v) => v == null || v.trim().isEmpty ? 'Requerido' : null,
              ),
              const SizedBox(height: 16),
              BlocBuilder<ProvincialBloc, ProvincialState>(
                builder: (context, state) {
                  final recintos = state is ProvincialLoaded ? state.recintos : <RecintoEntity>[];
                  final disponibles = recintos.where((r) => r.coordinadorId == null).toList();
                  return DropdownButtonFormField<String>(
                    initialValue: _selectedRecintoId,
                    decoration: const InputDecoration(
                      labelText: 'Recinto',
                      prefixIcon: Icon(Icons.location_city),
                    ),
                    items: disponibles.map((r) {
                      return DropdownMenuItem(value: r.id, child: Text(r.nombre));
                    }).toList(),
                    onChanged: (v) => setState(() => _selectedRecintoId = v),
                    validator: (v) => v == null ? 'Selecciona un recinto' : null,
                  );
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _loading ? null : _submit,
                child: _loading
                    ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Crear Coordinador'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

