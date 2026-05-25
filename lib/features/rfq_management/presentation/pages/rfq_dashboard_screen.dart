import 'package:flutter/material.dart';
import 'rfq_details_screen.dart';

class RfqDashboardScreen extends StatelessWidget {
  final String userRole;

  const RfqDashboardScreen({
    Key? key,
    this.userRole = 'SuperAdmin',
  }) : super(key: key);

  static const Color darkText = Color(0xFF111827);
  static const Color primaryColor = Color(0xFF2563EB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBBCFE4),

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(15),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFBBCFE4),
                Color(0xFFAECFF3),
                Color(0xFF8EABCC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),

          ),

        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFBBCFE4),
              Color(0xFFAECFF3),
              Color(0xFF8EABCC),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                ' RFQ Dashboard',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildSummaryCard(
                      'Open RFQs',
                      '24',
                      Icons.pending_actions_rounded,
                      Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSummaryCard(
                      'Closed RFQs',
                      '150',
                      Icons.check_circle_rounded,
                      Colors.green,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'Recent RFQs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 12),

              _buildRfqList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
      String title,
      String count,
      IconData icon,
      Color color,
      ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.88),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.75),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: color,
              size: 26,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            count,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
///Recent rfqs===================

  Widget _buildRfqList(BuildContext context) {
    final rfqs = [
      {
        'id': 'RFQ-2026-001',
        'title': 'Laptops for IT Dept',
        'status': 'Open',
        'bids': 5,
      },
      {
        'id': 'RFQ-2026-002',
        'title': 'Office Furniture',
        'status': 'Open',
        'bids': 2,
      },
      {
        'id': 'RFQ-2026-003',
        'title': 'Cloud Servers',
        'status': 'Closed',
        'bids': 12,
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: rfqs.length,
      itemBuilder: (context, index) {
        final rfq = rfqs[index];
        final isOpen = rfq['status'] == 'Open';

        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.92),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withOpacity(0.75),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RfqDetailsScreen(
                      rfqId: rfq['id'] as String,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: isOpen
                              ? [
                            Colors.orange.withOpacity(0.85),
                            Colors.deepOrange.withOpacity(0.75),
                          ]
                              : [
                            const Color(0xFF8EABCC),
                            const Color(0xFFBBCFE4),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(
                        Icons.request_quote_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            rfq['title'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: darkText,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            '${rfq['id']} • ${rfq['bids']} Bids Received',
                            style: const TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: isOpen
                                  ? Colors.orange.withOpacity(0.12)
                                  : Colors.grey.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              rfq['status'] as String,
                              style: TextStyle(
                                color: isOpen ? Colors.orange : Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.chevron_right_rounded,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}