import 'package:flutter/material.dart';

class MesaDetailPage extends StatelessWidget {
  final String mesaId;
  const MesaDetailPage({super.key, required this.mesaId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle Mesa')),
      body: Center(child: Text('Mesa ID: $mesaId')),
    );
  }
}
