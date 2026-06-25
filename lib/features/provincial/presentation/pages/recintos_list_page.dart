import 'package:flutter/material.dart';

class RecintosListPage extends StatelessWidget {
  const RecintosListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recintos')),
      body: const Center(child: Text('Lista de recintos')),
    );
  }
}
