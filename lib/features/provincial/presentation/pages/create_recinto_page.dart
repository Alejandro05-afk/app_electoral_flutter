import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:control_electoral/features/provincial/presentation/bloc/provincial_bloc.dart';
import 'package:control_electoral/features/provincial/domain/entities/recinto_entity.dart';
import 'package:control_electoral/features/auth/presentation/bloc/auth_bloc.dart';

class CreateRecintoPage extends StatefulWidget {
  const CreateRecintoPage({super.key});
  @override
  State<CreateRecintoPage> createState() => _CreateRecintoPageState();
}

class _CreateRecintoPageState extends State<CreateRecintoPage> {
  final _formKey = GlobalKey<FormState>();
  final _cantonCtrl = TextEditingController();
  final _parroquiaCtrl = TextEditingController();
  final _nombreCtrl = TextEditingController();
  final _numJrvCtrl = TextEditingController();

  @override
  void dispose() {
    _cantonCtrl.dispose();
    _parroquiaCtrl.dispose();
    _nombreCtrl.dispose();
    _numJrvCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final authState = context.read<AuthBloc>().state;
      final userId = authState is AuthAuthenticated ? authState.user.id : '';
      final recinto = RecintoEntity(
        id: '',
        canton: _cantonCtrl.text.trim(),
        parroquia: _parroquiaCtrl.text.trim(),
        nombre: _nombreCtrl.text.trim(),
        numJrv: int.parse(_numJrvCtrl.text.trim()),
        createdBy: userId,
      );
      context.read<ProvincialBloc>().add(CreateRecinto(recinto: recinto));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Recinto')),
      body: BlocConsumer<ProvincialBloc, ProvincialState>(
        listener: (context, state) {
          if (state is ProvincialLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Recinto creado exitosamente'), backgroundColor: Colors.green),
            );
            context.pop();
          }
          if (state is ProvincialError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _nombreCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Nombre del recinto',
                      prefixIcon: Icon(Icons.location_city),
                    ),
                    validator: (v) => v == null || v.trim().isEmpty ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _cantonCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Cantón',
                      prefixIcon: Icon(Icons.map),
                    ),
                    validator: (v) => v == null || v.trim().isEmpty ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _parroquiaCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Parroquia',
                      prefixIcon: Icon(Icons.map_outlined),
                    ),
                    validator: (v) => v == null || v.trim().isEmpty ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _numJrvCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Número de JRV',
                      prefixIcon: Icon(Icons.numbers),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return 'Requerido';
                      if (int.tryParse(v.trim()) == null || int.parse(v.trim()) <= 0) {
                        return 'Ingresa un número válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: state is ProvincialLoading ? null : _submit,
                    child: state is ProvincialLoading
                        ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                        : const Text('Crear Recinto'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

