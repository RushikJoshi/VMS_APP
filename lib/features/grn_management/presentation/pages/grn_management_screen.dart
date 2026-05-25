import 'package:flutter/material.dart';

class GrnManagementScreen extends StatelessWidget {
  final String userRole;
  const GrnManagementScreen({Key? key, this.userRole = 'SuperAdmin'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GRN Management', style: TextStyle(fontWeight: FontWeight.bold))),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('GRN-2026-00${index+1}', style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Awaiting Damage Verification & Quantity Matching'),
              trailing: ElevatedButton(onPressed: (){}, child: const Text('Verify')),
            ),
          );
        },
      ),
    );
  }
}
