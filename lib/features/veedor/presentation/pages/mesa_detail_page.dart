import 'package:flutter/material.dart';

class VeedorMesaDetailPage extends StatelessWidget {
  final String mesaId;
  const VeedorMesaDetailPage({super.key, required this.mesaId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle Mesa')),
      body: Center(child: Text('Mesa ID: $mesaId')),
    );
  }
}
