import 'package:flutter/material.dart';
import 'po_details_screen.dart';

class PoListScreen extends StatelessWidget {
  final String userRole;
  const PoListScreen({Key? key, this.userRole = 'SuperAdmin'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Purchase Orders', style: TextStyle(fontWeight: FontWeight.bold))),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('PO-2026-00${index+1}', style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Status: Pending Approval'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PoDetailsScreen(poId: 'PO-2026-00${index+1}'))),
            ),
          );
        },
      ),
    );
  }
}
