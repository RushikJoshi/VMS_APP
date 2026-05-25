import 'package:flutter/material.dart';

class QuotationComparisonScreen extends StatelessWidget {
  final String userRole;
  const QuotationComparisonScreen({Key? key, this.userRole = 'SuperAdmin'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Bid Matrix Analysis', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Info Card
            _buildRfqHeaderCard(),
            const SizedBox(height: 20),
            
            // Grid of Vendor Highlights
            const Text(
              'Comparative Summary',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            _buildComparisonCarousels(context),
            const SizedBox(height: 24),
            
            // Detailed Parameter Grid
            const Text(
              'Detailed Specifications Comparison',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            _buildSpecsTable(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildRfqHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.request_quote, color: Color(0xFF6366F1)),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RFQ-2026-001 • Laptops for IT Dept',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0F172A)),
                ),
                SizedBox(height: 4),
                Text(
                  '3 total bids received • Target Delivery: 20 June 2026',
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComparisonCarousels(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _buildVendorProposalCard(
            context,
            vendorName: 'Global Supplies Ltd.',
            price: '₹12,45,000',
            days: '15 Days',
            score: '9.4',
            badge: 'RECOMMENDED (HIGH RELIABILITY)',
            badgeColor: const Color(0xFF10B981),
            isRecommended: true,
          ),
          const SizedBox(width: 16),
          _buildVendorProposalCard(
            context,
            vendorName: 'Tech Hardware Inc.',
            price: '₹11,90,000',
            days: '30 Days',
            score: '8.8',
            badge: 'CHEAPEST OPTION',
            badgeColor: const Color(0xFF0EA5E9),
            isRecommended: false,
          ),
          const SizedBox(width: 16),
          _buildVendorProposalCard(
            context,
            vendorName: 'Office Essentials Co.',
            price: '₹13,10,000',
            days: '10 Days',
            score: '8.2',
            badge: 'FASTEST DELIVERY',
            badgeColor: const Color(0xFFF59E0B),
            isRecommended: false,
          ),
        ],
      ),
    );
  }

  Widget _buildVendorProposalCard(
    BuildContext context, {
    required String vendorName,
    required String price,
    required String days,
    required String score,
    required String badge,
    required Color badgeColor,
    required bool isRecommended,
  }) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isRecommended ? const Color(0xFF6366F1) : const Color(0xFFE2E8F0),
          width: isRecommended ? 2.0 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64748B).withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: badgeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              badge,
              style: TextStyle(color: badgeColor, fontSize: 9, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            vendorName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0F172A)),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('BID AMOUNT', style: TextStyle(fontSize: 9, color: Color(0xFF94A3B8), fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('RATING', style: TextStyle(fontSize: 9, color: Color(0xFF94A3B8), fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECFDF5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      score,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF10B981)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.timer, size: 14, color: Color(0xFF64748B)),
              const SizedBox(width: 4),
              Text(
                'Delivery in $days',
                style: const TextStyle(fontSize: 12, color: Color(0xFF475569), fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _showApprovalDialog(context, vendorName, price);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isRecommended ? const Color(0xFF6366F1) : const Color(0xFF0F172A),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              child: const Text(
                'Select Proposal',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecsTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          _buildTableRow('Vendor Name', 'Global Supplies', 'Tech Hardware', 'Office Essentials', isHeader: true),
          const Divider(height: 1, color: Color(0xFFE2E8F0)),
          _buildTableRow('Warranty', '3 Years On-site', '2 Years Carry-in', '1 Year Standard'),
          const Divider(height: 1, color: Color(0xFFE2E8F0)),
          _buildTableRow('Payment Terms', 'Net 30 days', '50% Advance', 'Net 15 days'),
          const Divider(height: 1, color: Color(0xFFE2E8F0)),
          _buildTableRow('SLA Score', '98.5%', '92.1%', '85.4%'),
          const Divider(height: 1, color: Color(0xFFE2E8F0)),
          _buildTableRow('Technical Rank', 'Rank 1', 'Rank 2', 'Rank 3'),
          const Divider(height: 1, color: Color(0xFFE2E8F0)),
          _buildTableRow('Support Response', '< 2 Hours', '< 4 Hours', '< 24 Hours'),
        ],
      ),
    );
  }

  Widget _buildTableRow(String criterion, String v1, String v2, String v3, {bool isHeader = false}) {
    final style = TextStyle(
      fontSize: 13,
      fontWeight: isHeader ? FontWeight.bold : FontWeight.w500,
      color: isHeader ? const Color(0xFF0F172A) : const Color(0xFF475569),
    );

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              criterion,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isHeader ? const Color(0xFF0F172A) : const Color(0xFF94A3B8),
              ),
            ),
          ),
          Expanded(flex: 3, child: Text(v1, style: style)),
          Expanded(flex: 3, child: Text(v2, style: style)),
          Expanded(flex: 3, child: Text(v3, style: style)),
        ],
      ),
    );
  }

  void _showApprovalDialog(BuildContext context, String vendor, String amount) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Color(0xFF10B981)),
            SizedBox(width: 10),
            Text('Confirm Selection'),
          ],
        ),
        content: Text(
          'You are selecting "$vendor" for the procurement of Laptops at the price of $amount. '
          'This will automatically trigger PO Draft generation.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Color(0xFF64748B))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Proposal approved! PO created successfully for $vendor.'),
                  backgroundColor: const Color(0xFF10B981),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6366F1),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Approve & Generate PO', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
