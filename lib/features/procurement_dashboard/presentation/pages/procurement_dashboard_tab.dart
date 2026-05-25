import 'package:flutter/material.dart';
import '../../../../features/rfq_management/presentation/pages/rfq_dashboard_screen.dart';
import '../../../../features/purchase_orders/presentation/pages/po_list_screen.dart';

class ProcurementDashboardTab extends StatelessWidget {
  const ProcurementDashboardTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Modern slate-50 light background
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section with modern greeting
            _buildWelcomeHeader(),
            const SizedBox(height: 24),
            
            // Analytics Grid
            const Text(
              'Procurement Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            _buildAnalyticsGrid(),
            const SizedBox(height: 28),
            
            // Quick Actions Section
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            _buildQuickActions(context),
            const SizedBox(height: 28),
            
            // Procurement trends or charts
            const Text(
              'Quarterly Spending Trends',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            _buildSpendTrendCard(),
            const SizedBox(height: 28),

            // Pending Approvals & Tasks
            _buildPendingTasksSection(),
            const SizedBox(height: 28),

            // Recent Activities
            const Text(
              'Recent Operations Log',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            _buildRecentOperations(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)], // Dark slate theme
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xFF38BDF8), // Light cyan accent
            child: Icon(Icons.engineering, size: 32, color: Color(0xFF0F172A)),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, Mayur bhai!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Procurement Manager • Acme Corp ERP',
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyticsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      children: [
        _buildStatCard('Active RFQs', '14', '3 closing today', Icons.request_quote, Colors.indigo, const Color(0xFF6366F1)),
        _buildStatCard('Received Bids', '48', '+12 since yesterday', Icons.gavel, Colors.orange, const Color(0xFFF97316)),
        _buildStatCard('Pending POs', '6', 'Requires signature', Icons.shopping_cart, Colors.blue, const Color(0xFF0EA5E9)),
        _buildStatCard('Active Contracts', '9', '2 expiring soon', Icons.description, Colors.teal, const Color(0xFF14B8A6)),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, String subtitle, IconData icon, Color color, Color accentColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64748B).withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Color(0xFF64748B), fontSize: 13, fontWeight: FontWeight.w600),
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: color.withOpacity(0.1),
                  child: Icon(icon, color: accentColor, size: 16),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 10, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _buildActionButton(
            context,
            Icons.add_shopping_cart,
            'Create RFQ',
            const Color(0xFF6366F1),
            () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RfqDashboardScreen(userRole: 'ProcurementManager'))),
          ),
          const SizedBox(width: 12),
          _buildActionButton(
            context,
            Icons.compare,
            'Compare Quotes',
            const Color(0xFFF97316),
            () {}, // Direct trigger from comparative analysis later
          ),
          const SizedBox(width: 12),
          _buildActionButton(
            context,
            Icons.receipt_long,
            'Generate PO',
            const Color(0xFF10B981),
            () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PoListScreen(userRole: 'ProcurementManager'))),
          ),
          const SizedBox(width: 12),
          _buildActionButton(
            context,
            Icons.border_color,
            'Draft Contract',
            const Color(0xFF8B5CF6),
            () {},
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label, Color color, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 130,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: color,
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpendTrendCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64748B).withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '₹48.2 Lakhs Spend',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Fiscal Year 2026 Procurement volume',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.trending_up, color: Color(0xFF10B981), size: 16),
                    SizedBox(width: 4),
                    Text(
                      '+14.2%',
                      style: TextStyle(
                        color: Color(0xFF10B981),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Beautiful pseudo-graph using vertical bars
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBar('Jan', 0.4),
              _buildBar('Feb', 0.6),
              _buildBar('Mar', 0.5),
              _buildBar('Apr', 0.85, isHighlighted: true),
              _buildBar('May', 0.7),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBar(String month, double ratio, {bool isHighlighted = false}) {
    return Column(
      children: [
        Container(
          height: 100 * ratio,
          width: 24,
          decoration: BoxDecoration(
            color: isHighlighted ? const Color(0xFF6366F1) : const Color(0xFFE2E8F0),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          month,
          style: TextStyle(
            color: isHighlighted ? const Color(0xFF6366F1) : const Color(0xFF64748B),
            fontSize: 12,
            fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildPendingTasksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pending Actions',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF64748B).withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildActionTile(
                'Quote Negotiation',
                'RFQ-2026-001 (Laptops) requires final negotiation.',
                Icons.rate_review,
                Colors.orange,
              ),
              const Divider(height: 1, indent: 60),
              _buildActionTile(
                'Contract Approvals',
                'Signature pending from Legal for Tech Solutions agreement.',
                Icons.assignment_turned_in,
                Colors.indigo,
              ),
              const Divider(height: 1, indent: 60),
              _buildActionTile(
                'Shipment Mismatch',
                'SHP-99042 has weight discrepancy in Customs report.',
                Icons.warning,
                Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionTile(String title, String subtitle, IconData icon, Color color) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: color.withOpacity(0.1),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0F172A)),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF94A3B8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget _buildRecentOperations() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildOperationRow(
            'RFQ Published',
            'RFQ-2026-004 published successfully.',
            Icons.outbox,
            Colors.blue,
            'Just now',
          ),
          const Divider(height: 1, indent: 60),
          _buildOperationRow(
            'PO Generated',
            'PO-88390 sent to Tech Hardware Inc.',
            Icons.receipt,
            Colors.green,
            '2 hours ago',
          ),
          const Divider(height: 1, indent: 60),
          _buildOperationRow(
            'Vendor Shortlisted',
            'Global Supplies Ltd. shortlisted for RFQ-2026-001.',
            Icons.group_add,
            Colors.orange,
            '1 day ago',
          ),
        ],
      ),
    );
  }

  Widget _buildOperationRow(String title, String details, IconData icon, Color color, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                ),
                const SizedBox(height: 2),
                Text(
                  details,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
          ),
        ],
      ),
    );
  }
}
