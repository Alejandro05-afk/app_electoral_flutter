import 'package:flutter/material.dart';

class CreateRecintoPage extends StatelessWidget {
  const CreateRecintoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Recinto')),
      body: const Center(child: Text('Formulario de recinto')),
    );
  }
}
