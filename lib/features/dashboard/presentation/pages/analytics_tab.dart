import 'package:flutter/material.dart';

class AnalyticsTab extends StatelessWidget {
  const AnalyticsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enterprise Analytics',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          _buildChartPlaceholder('Revenue Growth'),
          const SizedBox(height: 16),
          _buildChartPlaceholder('Vendor Onboarding Trends'),
          const SizedBox(height: 16),
          _buildChartPlaceholder('Logistics & Shipments Overview'),
        ],
      ),
    );
  }

  Widget _buildChartPlaceholder(String title) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 16),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.bar_chart, size: 64, color: Colors.blueGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
