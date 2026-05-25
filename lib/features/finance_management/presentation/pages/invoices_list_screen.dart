import 'package:flutter/material.dart';

class InvoicesListScreen extends StatelessWidget {
  final String userRole;
  const InvoicesListScreen({Key? key, this.userRole = 'SuperAdmin'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoices', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
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
                      hintText: 'Search Invoices...',
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
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildInvoiceCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceCard(int index) {
    final invoices = [
      {'id': 'INV-2026-104', 'client': 'TechCorp Global', 'amount': '\$45,000.00', 'status': 'Paid', 'date': 'May 20, 2026'},
      {'id': 'INV-2026-105', 'client': 'Innovate Inc', 'amount': '\$12,500.00', 'status': 'Pending', 'date': 'May 22, 2026'},
      {'id': 'INV-2026-106', 'client': 'Alpha Logistics', 'amount': '\$8,900.00', 'status': 'Overdue', 'date': 'May 10, 2026'},
    ];

    final invoice = invoices[index];
    final status = invoice['status'] as String;
    
    Color statusColor;
    if (status == 'Paid') statusColor = Colors.green;
    else if (status == 'Pending') statusColor = Colors.orange;
    else statusColor = Colors.red;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundColor: statusColor.withOpacity(0.1),
          child: Icon(Icons.receipt, color: statusColor),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(invoice['id'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(invoice['amount'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text('Client: ${invoice['client']}'),
            const SizedBox(height: 4),
            Text('Date: ${invoice['date']}'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(status, style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        onTap: () {
          // Navigate to Invoice Details
        },
      ),
    );
  }
}
