import 'package:flutter/material.dart';
import 'user_details_screen.dart';

class UsersListScreen extends StatelessWidget {
  final String userRole;
  const UsersListScreen({Key? key, this.userRole = 'SuperAdmin'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.person_add), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Users...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildUserCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserCard(BuildContext context, int index) {
    final users = [
      {'name': 'Mayur Bhai', 'email': 'mayur@vms.com', 'role': 'Super Admin', 'status': 'Active', 'color': Colors.redAccent},
      {'name': 'John Doe', 'email': 'john@techcorp.com', 'role': 'Admin', 'status': 'Active', 'color': Colors.blue},
      {'name': 'Jane Smith', 'email': 'jane@innovate.com', 'role': 'Procurement Team', 'status': 'Active', 'color': Colors.orange},
      {'name': 'Bob Vendor', 'email': 'bob@supplies.com', 'role': 'Vendor', 'status': 'Inactive', 'color': Colors.grey},
    ];

    final user = users[index];

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: CircleAvatar(
          backgroundColor: (user['color'] as Color).withOpacity(0.1),
          child: Icon(Icons.person, color: user['color'] as Color),
        ),
        title: Text(user['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(user['email'] as String, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: (user['color'] as Color).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(user['role'] as String, style: TextStyle(color: user['color'] as Color, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        trailing: const Icon(Icons.more_vert, color: Colors.grey),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const UserDetailsScreen()));
        },
      ),
    );
  }
}
