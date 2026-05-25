import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopSection(),
          const SizedBox(height: 24),
          const Text('Global Analytics', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _buildAnalyticsGrid(),
          const SizedBox(height: 24),
          const Text('Performance Graphs', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _buildGraphsSection(),
          const SizedBox(height: 24),
          const Text('Quick Actions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _buildQuickActions(),
          const SizedBox(height: 24),
          const Text('Recent Activities', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _buildRecentActivities(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildTopSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 250, child: _buildTopCard('Total Revenue', '\$1.2M', Icons.attach_money, Colors.green)),
          const SizedBox(width: 12),
          SizedBox(width: 250, child: _buildTopCard('Active Companies', '142', Icons.business, Colors.blue)),
          const SizedBox(width: 12),
          SizedBox(width: 250, child: _buildTopCard('Active Users', '1,048', Icons.people, Colors.orange)),
        ],
      ),
    );
  }

  Widget _buildTopCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 32),
            const SizedBox(height: 16),
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(color: Colors.white70)),
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
        _buildStatCard('Companies', '142', 'Total SaaS Clients', Icons.business, Colors.indigo),
        _buildStatCard('Vendors', '38', 'Registered Vendors', Icons.store, Colors.teal),
        _buildStatCard('RFQs', '24', 'Procurement Activity', Icons.request_quote, Colors.amber),
        _buildStatCard('Revenue', '\$1.2M', 'Total Earnings', Icons.monetization_on, Colors.green),
        _buildStatCard('Shipments', '420', 'Logistics Activity', Icons.local_shipping, Colors.blue),
        _buildStatCard('Payments', '\$850K', 'Finance Activity', Icons.payment, Colors.deepPurple),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, String subtitle, IconData icon, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              radius: 24,
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
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

  Widget _buildGraphsSection() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _buildGraphCard('Revenue Growth (YTD)', _buildRevenueLineChart()),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 1,
              child: _buildGraphCard('Shipment Analytics', _buildShipmentPieChart()),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: _buildGraphCard('Vendor Growth', _buildVendorBarChart()),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 1,
              child: _buildGraphCard('RFQ Trends', _buildRFQBarChart()),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGraphCard(String title, Widget chart) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(height: 200, child: chart),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueLineChart() {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true, drawVerticalLine: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 22, getTitlesWidget: (val, meta) {
            const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
            if (val.toInt() >= 0 && val.toInt() < months.length) {
              return Text(months[val.toInt()], style: const TextStyle(fontSize: 10));
            }
            return const Text('');
          })),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: const [FlSpot(0, 1), FlSpot(1, 1.5), FlSpot(2, 1.4), FlSpot(3, 3.4), FlSpot(4, 2), FlSpot(5, 4)],
            isCurved: true,
            color: Colors.green,
            barWidth: 3,
            belowBarData: BarAreaData(show: true, color: Colors.green.withOpacity(0.2)),
            dotData: const FlDotData(show: false),
          ),
        ],
      ),
    );
  }

  Widget _buildShipmentPieChart() {
    return PieChart(
      PieChartData(
        sectionsSpace: 2,
        centerSpaceRadius: 40,
        sections: [
          PieChartSectionData(color: Colors.green, value: 60, title: '60%', radius: 30, titleStyle: const TextStyle(fontSize: 10, color: Colors.white)),
          PieChartSectionData(color: Colors.blue, value: 30, title: '30%', radius: 30, titleStyle: const TextStyle(fontSize: 10, color: Colors.white)),
          PieChartSectionData(color: Colors.red, value: 10, title: '10%', radius: 30, titleStyle: const TextStyle(fontSize: 10, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildVendorBarChart() {
    return BarChart(
      BarChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8, color: Colors.teal)]),
          BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10, color: Colors.teal)]),
          BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 14, color: Colors.teal)]),
          BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 15, color: Colors.teal)]),
        ],
      ),
    );
  }

  Widget _buildRFQBarChart() {
    return BarChart(
      BarChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 5, color: Colors.amber)]),
          BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 12, color: Colors.amber)]),
          BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 8, color: Colors.amber)]),
          BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 20, color: Colors.amber)]),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildActionButton(Icons.add_business, 'Add Company', Colors.blue),
          const SizedBox(width: 12),
          _buildActionButton(Icons.campaign, 'Broadcast Notification', Colors.orange),
          const SizedBox(width: 12),
          _buildActionButton(Icons.summarize, 'Generate Reports', Colors.green),
          const SizedBox(width: 12),
          _buildActionButton(Icons.block, 'Suspend Company', Colors.red),
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

  Widget _buildRecentActivities() {
    final activities = [
      {'icon': Icons.verified, 'title': 'New Vendor Approved', 'time': '5 mins ago', 'color': Colors.green},
      {'icon': Icons.warning, 'title': 'Shipment Delayed - SHP-9013', 'time': '2 hours ago', 'color': Colors.red},
      {'icon': Icons.payment, 'title': 'Payment Completed - \$45k', 'time': '3 hours ago', 'color': Colors.blue},
      {'icon': Icons.security, 'title': 'Security Alert - Failed Login', 'time': '5 hours ago', 'color': Colors.orange},
      {'icon': Icons.card_membership, 'title': 'Subscription Activated - Innovate Inc', 'time': '1 day ago', 'color': Colors.purple},
    ];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: activities.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final act = activities[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: (act['color'] as Color).withOpacity(0.1),
              child: Icon(act['icon'] as IconData, color: act['color'] as Color),
            ),
            title: Text(act['title'] as String, style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text(act['time'] as String),
            trailing: const Icon(Icons.more_vert, color: Colors.grey),
          );
        },
      ),
    );
  }
}
