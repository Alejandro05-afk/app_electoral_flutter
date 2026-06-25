import 'package:flutter/material.dart';

class CreateCoordinadorPage extends StatelessWidget {
  const CreateCoordinadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Coordinador')),
      body: const Center(child: Text('Formulario de coordinador')),
    );
  }
}
