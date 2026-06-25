import 'package:flutter/material.dart';

class CreateVeedorPage extends StatelessWidget {
  const CreateVeedorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Veedor')),
      body: const Center(child: Text('Formulario de veedor')),
    );
  }
}
