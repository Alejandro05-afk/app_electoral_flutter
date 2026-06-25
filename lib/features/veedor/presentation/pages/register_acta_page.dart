import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:control_electoral/features/veedor/presentation/bloc/acta_bloc.dart';

class RegisterActaPage extends StatefulWidget {
  final String mesaId;
  final String recintoId;
  final String dignidad;
  const RegisterActaPage({
    super.key,
    required this.mesaId,
    required this.recintoId,
    required this.dignidad,
  });

  @override
  State<RegisterActaPage> createState() => _RegisterActaPageState();
}

class _RegisterActaPageState extends State<RegisterActaPage> {
  final _formKey = GlobalKey<FormState>();
  final _totalSufragantesCtrl = TextEditingController();
  final _votosNulosCtrl = TextEditingController();
  final _votosBlancosCtrl = TextEditingController();
  final _votosOrgCtrl = List.generate(5, (_) => TextEditingController());

  @override
  void dispose() {
    _totalSufragantesCtrl.dispose();
    _votosNulosCtrl.dispose();
    _votosBlancosCtrl.dispose();
    for (final c in _votosOrgCtrl) {
      c.dispose();
    }
    super.dispose();
  }

  bool _validateTotals() {
    final votosOrg = _votosOrgCtrl.map((c) => int.tryParse(c.text) ?? 0).toList();
    final total = votosOrg.fold(0, (a, b) => a + b) +
        (int.tryParse(_votosNulosCtrl.text) ?? 0) +
        (int.tryParse(_votosBlancosCtrl.text) ?? 0);
    final sufragantes = int.tryParse(_totalSufragantesCtrl.text) ?? 0;
    return total == sufragantes;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (!_validateTotals()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('La suma de votos no coincide con el total de sufragantes'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Acta ${widget.dignidad}')),
      body: BlocConsumer<ActaBloc, ActaState>(
        listener: (context, state) {
          if (state is ActaError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          }
          if (state is ActaSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Acta registrada exitosamente')),
            );
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Votos por Organización',
                    style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  for (int i = 0; i < 5; i++) ...[
                    TextFormField(
                      controller: _votosOrgCtrl[i],
                      decoration: InputDecoration(
                        labelText: 'Organización ${i + 1}',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
                    ),
                    const SizedBox(height: 8),
                  ],
                  const Divider(),
                  TextFormField(
                    controller: _votosNulosCtrl,
                    decoration: const InputDecoration(labelText: 'Votos Nulos'),
                    keyboardType: TextInputType.number,
                    validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _votosBlancosCtrl,
                    decoration: const InputDecoration(labelText: 'Votos en Blanco'),
                    keyboardType: TextInputType.number,
                    validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _totalSufragantesCtrl,
                    decoration: const InputDecoration(labelText: 'Total Sufragantes'),
                    keyboardType: TextInputType.number,
                    validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: state is ActaLoading ? null : _submit,
                    icon: state is ActaLoading
                        ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                        : const Icon(Icons.save),
                    label: Text(state is ActaLoading ? 'Guardando...' : 'Guardar Acta'),
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
