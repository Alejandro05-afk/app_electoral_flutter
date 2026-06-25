import 'package:flutter/material.dart';

class MesasListPage extends StatelessWidget {
  const MesasListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mesas')),
      body: const Center(child: Text('Lista de mesas')),
    );
  }
}
