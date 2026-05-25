import 'package:flutter/material.dart';

class SupportCenterScreen extends StatelessWidget {
  const SupportCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Support Center', style: TextStyle(fontWeight: FontWeight.bold))),
      body: const Center(child: Text('Support Center UI (Tickets, Chat, FAQ)')),
    );
  }
}
