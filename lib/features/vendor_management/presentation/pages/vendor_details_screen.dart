import 'package:flutter/material.dart';

class VendorDetailsScreen extends StatelessWidget {
  final String vendorName;

  const VendorDetailsScreen({Key? key, required this.vendorName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vendorName, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVerificationAlert(),
            const SizedBox(height: 24),
            const Text('Vendor Analytics', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildVendorAnalytics(),
            const SizedBox(height: 24),
            const Text('Recent RFQ Participation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildRfqParticipation(),
          ],
        ),
      ),
    );
  }

  Widget _buildVerificationAlert() {
    return Card(
      color: Colors.orange.withOpacity(0.1),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.orange.withOpacity(0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 32),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pending Verification', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text('Please review the submitted compliance documents to verify this vendor.', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('Verify Now', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVendorAnalytics() {
    return Row(
      children: [
        Expanded(child: _buildAnalyticCard('Total Orders', '120', Icons.shopping_cart, Colors.blue)),
        const SizedBox(width: 12),
        Expanded(child: _buildAnalyticCard('Fulfillment Rate', '98.5%', Icons.check_circle, Colors.green)),
        const SizedBox(width: 12),
        Expanded(child: _buildAnalyticCard('Avg. Rating', '4.8', Icons.star, Colors.amber)),
      ],
    );
  }

  Widget _buildAnalyticCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildRfqParticipation() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.request_quote, color: Colors.white),
            ),
            title: Text('RFQ-2026-00${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Bid Submitted: \$12,500'),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          ),
        );
      },
    );
  }
}
