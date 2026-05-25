import 'package:flutter/material.dart';
import 'shipment_details_screen.dart';

class ShipmentDashboardScreen extends StatelessWidget {
  final String userRole;
  const ShipmentDashboardScreen({Key? key, this.userRole = 'SuperAdmin'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logistics & Shipments', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: _buildSummaryCard('In Transit', '18', Colors.blue)),
                const SizedBox(width: 12),
                Expanded(child: _buildSummaryCard('Delivered', '420', Colors.green)),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Active Shipments', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildShipmentList(),
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

  Widget _buildShipmentList() {
    final shipments = [
      {'id': 'SHP-9012', 'destination': 'Warehouse A', 'status': 'In Transit', 'eta': 'Today, 4:00 PM'},
      {'id': 'SHP-9013', 'destination': 'Warehouse B', 'status': 'Delayed', 'eta': 'Tomorrow, 10:00 AM'},
      {'id': 'SHP-9014', 'destination': 'Store 05', 'status': 'In Transit', 'eta': 'Today, 6:00 PM'},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: shipments.length,
      itemBuilder: (context, index) {
        final shipment = shipments[index];
        final isDelayed = shipment['status'] == 'Delayed';
        
        return Card(
          margin: const EdgeInsets.only(bottom: 12.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            leading: Icon(Icons.local_shipping, color: isDelayed ? Colors.red : Colors.blue),
            title: Text(shipment['id'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('To: ${shipment['destination']} • ETA: ${shipment['eta']}'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isDelayed ? Colors.red.withOpacity(0.1) : Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(shipment['status'] as String, style: TextStyle(color: isDelayed ? Colors.red : Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ShipmentDetailsScreen(shipmentId: shipment['id'] as String)));
            },
          ),
        );
      },
    );
  }
}
