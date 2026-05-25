import 'package:flutter/material.dart';

class SoListScreen extends StatelessWidget {
  final String userRole;
  const SoListScreen({Key? key, this.userRole = 'SuperAdmin'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sales Orders', style: TextStyle(fontWeight: FontWeight.bold))),
      body: const Center(child: Text('Sales Orders List (B2B SaaS Sales)')),
    );
  }
}
