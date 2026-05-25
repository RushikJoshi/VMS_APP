import 'package:flutter/material.dart';

class SecurityDashboardScreen extends StatelessWidget {
  const SecurityDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Security Center', style: TextStyle(fontWeight: FontWeight.bold))),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Card(child: ListTile(leading: Icon(Icons.security, color: Colors.red), title: Text('Failed Logins'), subtitle: Text('12 attempts in last 24h'))),
          Card(child: ListTile(leading: Icon(Icons.api, color: Colors.blue), title: Text('API Logs'), subtitle: Text('System operating normally.'))),
          Card(child: ListTile(leading: Icon(Icons.history, color: Colors.orange), title: Text('Audit Logs'), subtitle: Text('Review system-wide changes.'))),
        ],
      ),
    );
  }
}
