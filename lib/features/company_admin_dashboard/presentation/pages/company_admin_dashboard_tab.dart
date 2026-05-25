import 'package:flutter/material.dart';

class CompanyAdminDashboardTab extends StatelessWidget {
  const CompanyAdminDashboardTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Dashboard Overview', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildAnalyticsGrid(),
            const SizedBox(height: 24),
            const Text('Quick Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildQuickActions(),
            const SizedBox(height: 24),
            const Text('Procurement Trends', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildGraphPlaceholder('Procurement Trends & Monthly Spending'),
            const SizedBox(height: 24),
            const Text('Recent Activities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildRecentActivities(),
          ],
        ),
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
      childAspectRatio: 2.2,
      children: [
        _buildStatCard('Vendors', '42', 'Active Vendors', Icons.business, Colors.indigo),
        _buildStatCard('RFQs', '15', 'Active RFQs', Icons.request_quote, Colors.orange),
        _buildStatCard('Orders', '8', 'Active PO/SO', Icons.shopping_cart, Colors.blue),
        _buildStatCard('Shipments', '12', 'Active Deliveries', Icons.local_shipping, Colors.teal),
        _buildStatCard('Payments', '5', 'Pending Approvals', Icons.payment, Colors.red),
        _buildStatCard('Employees', '140', 'Company Users', Icons.people, Colors.green),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, String subtitle, IconData icon, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: color.withValues(alpha: 0.1),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w600)),
                  FittedBox(fit: BoxFit.scaleDown, child: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                  Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 9), overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildActionButton(Icons.business, 'Add Vendor', Colors.blue),
          const SizedBox(width: 12),
          _buildActionButton(Icons.add_shopping_cart, 'Create RFQ', Colors.orange),
          const SizedBox(width: 12),
          _buildActionButton(Icons.receipt, 'Generate PO', Colors.green),
          const SizedBox(width: 12),
          _buildActionButton(Icons.payment, 'Approve Invoice', Colors.red),
          const SizedBox(width: 12),
          _buildActionButton(Icons.analytics, 'View Analytics', Colors.indigo),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(label, style: const TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildGraphPlaceholder(String title) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bar_chart, size: 64, color: Colors.blue.shade200),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivities() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildActivityTile('Vendor Registered', 'Tech Solutions Inc. joined the platform.', Icons.person_add, Colors.blue, '10 mins ago'),
          _buildActivityTile('RFQ Created', 'RFQ-2023-089 for 50 Laptops published.', Icons.request_quote, Colors.orange, '1 hour ago'),
          _buildActivityTile('Shipment Delivered', 'SHP-99042 delivered to Mumbai Hub.', Icons.local_shipping, Colors.teal, '3 hours ago'),
          _buildActivityTile('Invoice Approved', 'INV-5502 approved by Finance.', Icons.receipt, Colors.green, '5 hours ago'),
          _buildActivityTile('Payment Released', 'â‚¹2,50,000 paid to Office Supplies Ltd.', Icons.payment, Colors.red, '1 day ago'),
        ],
      ),
    );
  }

  Widget _buildActivityTile(String title, String subtitle, IconData icon, Color color, String time) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.1),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
    );
  }
}
