import 'package:flutter/material.dart';

class CompanyDetailsScreen extends StatelessWidget {
  final String companyName;

  const CompanyDetailsScreen({Key? key, required this.companyName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(companyName, style: const TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCompanyInfoSection(),
            const SizedBox(height: 24),
            const Text('Company Analytics', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildAnalyticsGrid(),
            const SizedBox(height: 24),
            const Text('Company Users', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildUsersList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyInfoSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow(Icons.person, 'Admin Name', 'Mr. Robert Johnson'),
            const Divider(),
            _buildInfoRow(Icons.email, 'Email', 'admin@${companyName.toLowerCase().replaceAll(' ', '')}.com'),
            const Divider(),
            _buildInfoRow(Icons.phone, 'Phone', '+1 (555) 123-4567'),
            const Divider(),
            _buildInfoRow(Icons.location_on, 'Address', '123 Innovation Drive, Tech City, CA'),
            const Divider(),
            _buildInfoRow(Icons.receipt_long, 'GST Number', 'GST-8923-ABCD-1234'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 20),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
          const Spacer(),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildAnalyticsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 3,
      children: [
        _buildStatCard('Vendors', '15', Icons.store, Colors.teal),
        _buildStatCard('RFQs', '8', Icons.request_quote, Colors.amber),
        _buildStatCard('Orders', '120', Icons.shopping_cart, Colors.blue),
        _buildStatCard('Shipments', '45', Icons.local_shipping, Colors.orange),
        _buildStatCard('Revenue', '\$125K', Icons.monetization_on, Colors.green),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUsersList() {
    final users = [
      {'name': 'Alice Smith', 'role': 'Admin', 'color': Colors.red},
      {'name': 'Bob Jones', 'role': 'Procurement Team', 'color': Colors.orange},
      {'name': 'Charlie Davis', 'role': 'Finance Team', 'color': Colors.blue},
      {'name': 'David Evans', 'role': 'Employee', 'color': Colors.grey},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: (user['color'] as Color).withOpacity(0.1),
              child: Icon(Icons.person, color: user['color'] as Color),
            ),
            title: Text(user['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(user['role'] as String, style: TextStyle(color: user['color'] as Color, fontWeight: FontWeight.w500)),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          ),
        );
      },
    );
  }
}
