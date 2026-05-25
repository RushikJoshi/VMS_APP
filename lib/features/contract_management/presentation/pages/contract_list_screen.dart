import 'package:flutter/material.dart';

class ContractListScreen extends StatelessWidget {
  final String userRole;
  const ContractListScreen({Key? key, this.userRole = 'SuperAdmin'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Contracts & Agreements', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_task),
            tooltip: 'Draft Contract',
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          _buildSummarySection(),
          _buildFilterBar(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildContractCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummarySection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: Row(
        children: [
          Expanded(child: _buildSummaryItem('Total Active', '12', Colors.indigo)),
          Container(height: 30, width: 1, color: const Color(0xFFE2E8F0)),
          Expanded(child: _buildSummaryItem('Expiring Soon', '2', Colors.amber)),
          Container(height: 30, width: 1, color: const Color(0xFFE2E8F0)),
          Expanded(child: _buildSummaryItem('Pending Legal', '4', Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String count, Color color) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF64748B), fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildFilterBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search contract numbers, vendors...',
                prefixIcon: const Icon(Icons.search, size: 20, color: Color(0xFF64748B)),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.filter_list, color: Color(0xFF475569)),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildContractCard(BuildContext context, int index) {
    final contracts = [
      {
        'contractId': 'CON-2026-081',
        'vendor': 'Global Supplies Ltd.',
        'value': '₹48,50,000 / year',
        'duration': 'Jan 2026 - Dec 2027',
        'status': 'Active',
        'statusColor': const Color(0xFF10B981),
        'category': 'SLA Hardware Services',
      },
      {
        'contractId': 'CON-2026-042',
        'vendor': 'Tech Hardware Inc.',
        'value': '₹24,00,000 / year',
        'duration': 'Jun 2025 - May 2026',
        'status': 'Expiring Soon',
        'statusColor': const Color(0xFFF59E0B),
        'category': 'IT Procurement Framework',
      },
      {
        'contractId': 'CON-2026-119',
        'vendor': 'Office Essentials Co.',
        'value': '₹6,00,000 / year',
        'duration': 'Mar 2026 - Feb 2027',
        'status': 'Draft',
        'statusColor': const Color(0xFF3B82F6),
        'category': 'Stationery Framework Agreement',
      },
      {
        'contractId': 'CON-2025-003',
        'vendor': 'Logistics Pro',
        'value': '₹1,20,00,000 / year',
        'duration': 'Jan 2024 - Dec 2025',
        'status': 'Under Review',
        'statusColor': const Color(0xFF8B5CF6),
        'category': 'Global Freight Agreement',
      },
    ];

    final contract = contracts[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64748B).withOpacity(0.02),
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
            // Status and Contract ID
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contract['contractId'] as String,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      contract['category'] as String,
                      style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: (contract['statusColor'] as Color).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    contract['status'] as String,
                    style: TextStyle(
                      color: contract['statusColor'] as Color,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Divider(height: 1, color: Color(0xFFF1F5F9)),
            ),

            // Vendor Name
            Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: const Color(0xFF6366F1).withOpacity(0.1),
                  child: const Icon(Icons.business, size: 14, color: Color(0xFF6366F1)),
                ),
                const SizedBox(width: 8),
                Text(
                  contract['vendor'] as String,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Financial & Validity Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ANNUALIZED VALUE', style: TextStyle(fontSize: 10, color: Color(0xFF94A3B8), fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(
                      contract['value'] as String,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('VALIDITY PERIOD', style: TextStyle(fontSize: 10, color: Color(0xFF94A3B8), fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(
                      contract['duration'] as String,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF475569),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Quick Actions Row
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.picture_as_pdf, size: 16, color: Color(0xFF64748B)),
                    label: const Text('View PDF', style: TextStyle(color: Color(0xFF475569), fontSize: 12)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE2E8F0)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showRenewalDialog(context, contract['contractId'] as String, contract['vendor'] as String);
                    },
                    icon: const Icon(Icons.refresh, size: 16, color: Colors.white),
                    label: const Text('Renew / Amend', style: TextStyle(color: Colors.white, fontSize: 12)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F172A),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 10),
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

  void _showRenewalDialog(BuildContext context, String contractId, String vendor) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.history, color: Color(0xFF6366F1)),
            const SizedBox(width: 10),
            Text('Amend Contract $contractId'),
          ],
        ),
        content: Text(
          'Do you want to initiate a renewal amendment for the agreement with "$vendor"? '
          'This will duplicate the existing terms into a new Draft contract.',
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
                  content: Text('Amendment started! Draft created successfully for $vendor.'),
                  backgroundColor: const Color(0xFF6366F1),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6366F1),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Initiate Amendment', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
