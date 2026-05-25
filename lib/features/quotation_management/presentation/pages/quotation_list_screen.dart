import 'package:flutter/material.dart';
import 'quotation_comparison_screen.dart';

class QuotationListScreen extends StatelessWidget {
  final String userRole;
  const QuotationListScreen({Key? key, this.userRole = 'SuperAdmin'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Vendor Quotations', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.compare_arrows),
            tooltip: 'Compare Quotes',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QuotationComparisonScreen(userRole: userRole),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Filter Bar
          _buildFilterBar(),
          
          // Quotation List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildQuotationCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search quotations, vendors, RFQs...',
                prefixIcon: const Icon(Icons.search, size: 20, color: Color(0xFF64748B)),
                fillColor: const Color(0xFFF1F5F9),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.filter_list, color: Color(0xFF475569)),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuotationCard(BuildContext context, int index) {
    final quotes = [
      {
        'rfqId': 'RFQ-2026-001',
        'title': 'Laptops for IT Dept',
        'vendor': 'Global Supplies Ltd.',
        'amount': '₹12,45,000',
        'deliveryTime': '15 Days',
        'rating': 4.8,
        'status': 'Shortlisted',
        'statusColor': const Color(0xFF10B981),
      },
      {
        'rfqId': 'RFQ-2026-001',
        'title': 'Laptops for IT Dept',
        'vendor': 'Tech Hardware Inc.',
        'amount': '₹11,90,000',
        'deliveryTime': '30 Days',
        'rating': 4.5,
        'status': 'Negotiating',
        'statusColor': const Color(0xFFF97316),
      },
      {
        'rfqId': 'RFQ-2026-002',
        'title': 'Office Furniture Upgrade',
        'vendor': 'Office Essentials Co.',
        'amount': '₹4,20,000',
        'deliveryTime': '7 Days',
        'rating': 3.9,
        'status': 'Pending Review',
        'statusColor': const Color(0xFF3B82F6),
      },
      {
        'rfqId': 'RFQ-2026-003',
        'title': 'High-End Development Servers',
        'vendor': 'Logistics Pro (Hardware Div)',
        'amount': '₹35,80,000',
        'deliveryTime': '20 Days',
        'rating': 4.2,
        'status': 'Approved',
        'statusColor': const Color(0xFF8B5CF6),
      },
    ];

    final quote = quotes[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64748B).withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // RFQ Badge and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEF2F6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    quote['rfqId'] as String,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF475569),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: (quote['statusColor'] as Color).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    quote['status'] as String,
                    style: TextStyle(
                      color: quote['statusColor'] as Color,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // RFQ Title & Vendor
            Text(
              quote['title'] as String,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.store, size: 14, color: Color(0xFF64748B)),
                const SizedBox(width: 6),
                Text(
                  quote['vendor'] as String,
                  style: const TextStyle(
                    color: Color(0xFF475569),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Divider(height: 1, color: Color(0xFFF1F5F9)),
            ),
            
            // Stats Row: Amount, delivery, rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('QUOTE AMOUNT', style: TextStyle(fontSize: 10, color: Color(0xFF94A3B8), fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(
                      quote['amount'] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('DELIVERY TIMELINE', style: TextStyle(fontSize: 10, color: Color(0xFF94A3B8), fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(
                      quote['deliveryTime'] as String,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('VENDOR RATING', style: TextStyle(fontSize: 10, color: Color(0xFF94A3B8), fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          '${quote['rating']}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE2E8F0)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Negotiate',
                      style: TextStyle(
                        color: Color(0xFF475569),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuotationComparisonScreen(userRole: userRole),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6366F1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Compare Quote',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
