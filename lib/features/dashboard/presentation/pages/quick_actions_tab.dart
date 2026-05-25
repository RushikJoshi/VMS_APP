import 'package:flutter/material.dart';

class QuickActionsTab extends StatelessWidget {
  const QuickActionsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Operations',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.2,
            children: [
              _buildActionCard(Icons.business, 'Add Company', 'Create SaaS client', Colors.blue),
              _buildActionCard(Icons.subscriptions, 'Create Subscription', 'New plan', Colors.green),
              _buildActionCard(Icons.campaign, 'Broadcast Alert', 'Send global notice', Colors.orange),
              _buildActionCard(Icons.analytics, 'Generate Report', 'Analytics export', Colors.purple),
              _buildActionCard(Icons.block, 'Suspend Company', 'Block client', Colors.red),
              _buildActionCard(Icons.backup, 'Backup System', 'Create backup', Colors.teal),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Recent Quick Operations',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildRecentList(),
        ],
      ),
    );
  }

  Widget _buildActionCard(IconData icon, String title, String subtitle, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentList() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.flash_on, color: Colors.white, size: 20),
            ),
            title: Text('Operation ${index + 1} completed'),
            subtitle: const Text('2 hours ago'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          );
        },
      ),
    );
  }
}
