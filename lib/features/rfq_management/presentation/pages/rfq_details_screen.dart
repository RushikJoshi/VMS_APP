import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class RfqDetailsScreen extends StatelessWidget {
  final String rfqId;

  const RfqDetailsScreen({
    super.key,
    required this.rfqId,
  });

  static const Color darkText = Color(0xFF111827);
  static const Color lightText = Color(0xFF6B7280);
  static const Color primaryColor = Color(0xFF2563EB);
  static const Color bgColor = Color(0xFFF6F8FC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          "RFQ Details",
          style: TextStyle(
            color: darkText,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: darkText,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _rfqHeaderCard(),
            const SizedBox(height: 18),
            _sectionTitle("Requirement Details"),
            const SizedBox(height: 12),
            _requirementCard(),
            const SizedBox(height: 18),
            _sectionTitle("Vendor Bids"),
            const SizedBox(height: 12),
            _vendorBids(),
            const SizedBox(height: 18),
            _sectionTitle("RFQ Timeline"),
            const SizedBox(height: 12),
            _timeline(),
          ],
        ),
      ),
    );
  }
///header========================================
  Widget _rfqHeaderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF7FA2EA),
            Color(0xFF7B9EE6),
            Color(0xFF89A9EE),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -28,
            top: -20,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.request_quote_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "Laptops for IT Dept",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "$rfqId • Open",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.78),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 18),

              Row(
                children: [
                  _miniBox("5", "Bids"),
                  _miniBox("12 Jun", "Deadline"),
                  _miniBox("High", "Priority"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
///header=====================
  Widget _miniBox(String value, String title) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.16),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.78),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
///requirmenets details title================
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: darkText,
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _requirementCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          _infoRow("Item", "Laptops"),
          _infoRow("Quantity", "50 Units"),
          _infoRow("Department", "IT Department"),
          _infoRow("Budget", "₹12,50,000"),
          _infoRow("Delivery Location", "Mumbai Office"),
          _infoRow("Status", "Open"),
        ],
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: lightText,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: darkText,
              fontSize: 13,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
///vendor bids=================================
  Widget _vendorBids() {
    final bids = [
      ["Tech Solutions Inc.", "₹12,50,000", "Submitted", Colors.green],
      ["Global Supplies Ltd.", "₹13,20,000", "Submitted", Colors.green],
      ["Office Needs Co.", "Pending", "Waiting", Colors.orange],
    ];

    return Column(
      children: bids.map((bid) {
        final color = bid[3] as Color;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppColors.summerygredient1,
                AppColors.summerygredient2,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.12),
                child: Icon(Icons.business_rounded, color: color),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bid[0] as String,
                      style: const TextStyle(
                        color: darkText,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      bid[1] as String,
                      style: const TextStyle(
                        color: lightText,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  bid[2] as String,
                  style: TextStyle(
                    color: color,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
///RFQ timeline======================================
  Widget _timeline() {
    final items = [
      ["RFQ Created", "Admin created RFQ request", Icons.add_task, Colors.blue],
      ["Vendors Invited", "5 vendors invited", Icons.group_add, Colors.purple],
      ["Bids Received", "2 bids submitted", Icons.how_to_vote, Colors.green],
      ["Final Selection", "Pending approval", Icons.pending_actions, Colors.orange],
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        children: items.map((item) {
          final color = item[3] as Color;

          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: color.withOpacity(0.12),
                  child: Icon(item[2] as IconData, color: color),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item[0] as String,
                        style: const TextStyle(
                          color: darkText,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        item[1] as String,
                        style: const TextStyle(
                          color: lightText,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: const Color(0xFFE5E7EB)),
    );
  }
}