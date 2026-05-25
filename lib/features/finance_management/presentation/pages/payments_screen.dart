import 'package:flutter/material.dart';

class PaymentsScreen extends StatelessWidget {
  final String userRole;
  const PaymentsScreen({Key? key, this.userRole = 'SuperAdmin'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments & Transactions', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: _buildSummaryCard('Total Received', '\$850K', Colors.green)),
                const SizedBox(width: 12),
                Expanded(child: _buildSummaryCard('Pending', '\$45K', Colors.orange)),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Recent Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildTransactionsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String amount, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(amount, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionsList() {
    final transactions = [
      {'txId': 'TXN-909283', 'type': 'Incoming', 'amount': '+\$45,000.00', 'date': 'Today, 10:30 AM'},
      {'txId': 'TXN-909284', 'type': 'Outgoing', 'amount': '-\$2,500.00', 'date': 'Yesterday, 2:15 PM'},
      {'txId': 'TXN-909285', 'type': 'Incoming', 'amount': '+\$12,500.00', 'date': 'May 20, 2026'},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final tx = transactions[index];
        final isIncoming = tx['type'] == 'Incoming';
        
        return Card(
          margin: const EdgeInsets.only(bottom: 12.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: isIncoming ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
              child: Icon(isIncoming ? Icons.arrow_downward : Icons.arrow_upward, color: isIncoming ? Colors.green : Colors.red),
            ),
            title: Text(tx['txId'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(tx['date'] as String),
            trailing: Text(tx['amount'] as String, style: TextStyle(color: isIncoming ? Colors.green : Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        );
      },
    );
  }
}
