import 'package:flutter/material.dart';
import 'permission_matrix_screen.dart';

class RolesListScreen extends StatelessWidget {
  const RolesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roles & Permissions', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 4,
        itemBuilder: (context, index) {
          return _buildRoleCard(context, index);
        },
      ),
    );
  }

  Widget _buildRoleCard(BuildContext context, int index) {
    final roles = [
      {'name': 'Super Admin', 'users': 2, 'desc': 'Full system access across all tenants.', 'color': Colors.red},
      {'name': 'Admin', 'users': 15, 'desc': 'Tenant-level administrative access.', 'color': Colors.blue},
      {'name': 'Procurement Team', 'users': 42, 'desc': 'Access to Vendors, RFQs, and POs.', 'color': Colors.orange},
      {'name': 'Finance Team', 'users': 18, 'desc': 'Access to Invoices, Payments, and Revenue Analytics.', 'color': Colors.green},
    ];

    final role = roles[index];

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundColor: (role['color'] as Color).withOpacity(0.1),
          child: Icon(Icons.security, color: role['color'] as Color),
        ),
        title: Text(role['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(role['desc'] as String),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.people, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(child: Text('${role['users']} Assigned Users', style: const TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => PermissionMatrixScreen(roleName: role['name'] as String)));
          },
        ),
      ),
    );
  }
}
