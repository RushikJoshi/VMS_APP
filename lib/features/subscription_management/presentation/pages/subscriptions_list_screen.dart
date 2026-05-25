import 'package:flutter/material.dart';
import 'subscription_details_screen.dart';

class SubscriptionsListScreen extends StatelessWidget {
  const SubscriptionsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscriptions Management', style: TextStyle(fontWeight: FontWeight.bold)),
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
                      hintText: 'Search Plans...',
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
                return _buildSubscriptionCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard(BuildContext context, int index) {
    final plans = [
      {'name': 'Enterprise Plan', 'price': '\$999/mo', 'features': 'Unlimited Users, Full ERP', 'activeCompanies': 42, 'color': Colors.purple},
      {'name': 'Professional Plan', 'price': '\$499/mo', 'features': 'Up to 50 Users, Basic ERP', 'activeCompanies': 85, 'color': Colors.blue},
      {'name': 'Startup Plan', 'price': '\$199/mo', 'features': 'Up to 10 Users, Core Features', 'activeCompanies': 120, 'color': Colors.green},
    ];

    final plan = plans[index];

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const SubscriptionDetailsScreen()));
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border(left: BorderSide(width: 4, color: plan['color'] as Color)),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(plan['name'] as String, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(plan['price'] as String, style: TextStyle(color: plan['color'] as Color, fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              const SizedBox(height: 8),
              Text(plan['features'] as String, style: const TextStyle(color: Colors.grey)),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.business, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('${plan['activeCompanies']} Active Companies', style: const TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
