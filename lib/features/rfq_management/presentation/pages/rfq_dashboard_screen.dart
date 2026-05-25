import 'package:flutter/material.dart';
import 'rfq_details_screen.dart';

class RfqDashboardScreen extends StatelessWidget {
  final String userRole;
  const RfqDashboardScreen({Key? key, this.userRole = 'SuperAdmin'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RFQ Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: _buildSummaryCard('Open RFQs', '24', Colors.orange)),
                const SizedBox(width: 12),
                Expanded(child: _buildSummaryCard('Closed RFQs', '150', Colors.green)),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Recent RFQs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildRfqList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String count, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(count, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildRfqList() {
    final rfqs = [
      {'id': 'RFQ-2026-001', 'title': 'Laptops for IT Dept', 'status': 'Open', 'bids': 5},
      {'id': 'RFQ-2026-002', 'title': 'Office Furniture', 'status': 'Open', 'bids': 2},
      {'id': 'RFQ-2026-003', 'title': 'Cloud Servers', 'status': 'Closed', 'bids': 12},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: rfqs.length,
      itemBuilder: (context, index) {
        final rfq = rfqs[index];
        final isOpen = rfq['status'] == 'Open';
        return Card(
          margin: const EdgeInsets.only(bottom: 12.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            leading: Icon(Icons.request_quote, color: isOpen ? Colors.orange : Colors.grey),
            title: Text(rfq['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${rfq['id']} • ${rfq['bids']} Bids Received'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isOpen ? Colors.orange.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(rfq['status'] as String, style: TextStyle(color: isOpen ? Colors.orange : Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => RfqDetailsScreen(rfqId: rfq['id'] as String)));
            },
          ),
        );
      },
    );
  }
}
