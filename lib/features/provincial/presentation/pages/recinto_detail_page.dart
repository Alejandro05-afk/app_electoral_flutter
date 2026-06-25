import 'package:flutter/material.dart';

class RecintoDetailPage extends StatelessWidget {
  final String recintoId;
  const RecintoDetailPage({super.key, required this.recintoId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle Recinto')),
      body: Center(child: Text('Recinto ID: $recintoId')),
    );
  }
}
