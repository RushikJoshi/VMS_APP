import 'package:flutter/material.dart';

class SystemSettingsScreen extends StatelessWidget {
  const SystemSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('System Settings', style: TextStyle(fontWeight: FontWeight.bold))),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(leading: Icon(Icons.settings), title: Text('General Settings')),
          ListTile(leading: Icon(Icons.email), title: Text('SMTP Settings')),
          ListTile(leading: Icon(Icons.api), title: Text('API Configurations')),
          ListTile(leading: Icon(Icons.color_lens), title: Text('Theme Settings')),
        ],
      ),
    );
  }
}
