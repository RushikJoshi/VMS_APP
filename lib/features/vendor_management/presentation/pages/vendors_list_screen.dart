import 'package:flutter/material.dart';
import 'vendor_details_screen.dart';

class VendorsListScreen extends StatelessWidget {
  final String userRole;
  const VendorsListScreen({Key? key, this.userRole = 'SuperAdmin'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendor Monitoring', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          if (userRole == 'SuperAdmin')
            IconButton(icon: const Icon(Icons.add_business), onPressed: () {}),
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
                      hintText: 'Search Vendors...',
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
                return _buildVendorCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVendorCard(BuildContext context, int index) {
    final vendors = [
      {'name': 'Global Supplies Ltd.', 'rating': 4.8, 'status': 'Verified', 'orders': 120, 'color': Colors.green},
      {'name': 'Tech Hardware Inc.', 'rating': 4.5, 'status': 'Verified', 'orders': 85, 'color': Colors.green},
      {'name': 'Office Essentials Co.', 'rating': 3.9, 'status': 'Pending Verification', 'orders': 10, 'color': Colors.orange},
      {'name': 'Logistics Pro', 'rating': 4.2, 'status': 'Verified', 'orders': 300, 'color': Colors.green},
    ];

    final vendor = vendors[index];

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: const CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.store, color: Colors.white),
        ),
        title: Text(vendor['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text('${vendor['rating']} Rating'),
                const SizedBox(width: 16),
                Icon(Icons.shopping_cart, color: Colors.grey[600], size: 16),
                const SizedBox(width: 4),
                Text('${vendor['orders']} Orders'),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: (vendor['color'] as Color).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(vendor['status'] as String, style: TextStyle(color: vendor['color'] as Color, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => VendorDetailsScreen(vendorName: vendor['name'] as String)));
        },
      ),
    );
  }
}
