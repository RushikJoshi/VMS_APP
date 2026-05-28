import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'po_details_screen.dart';

class PoListScreen extends StatelessWidget {
  final String userRole;

  const PoListScreen({
    Key? key,
    this.userRole = 'SuperAdmin',
  }) : super(key: key);

  //static const Color darkBlue = Color(0xFF0F2F9E);
  static const Color lightBg = Color(0xFFF3F5F9);
  static const Color textDark = Color(0xFF111827);
  static const Color textGrey = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: lightBg,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _searchRow(),
                    const SizedBox(height: 12),
                    _filterChips(),
                    const SizedBox(height: 18),
                    _valueCard(),
                    const SizedBox(height: 10),
                    _smallStats(),
                    const SizedBox(height: 18),
                    _recentHeader(),
                    const SizedBox(height: 12),
                    _orderList(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

     // bottomNavigationBar: _bottomNav(),
    );
  }


///search bar===============================
  Widget _searchRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: const Row(
              children: [
                Icon(Icons.search_rounded, color: textGrey, size: 20),
                SizedBox(width: 8),
                Text(
                  "Search POs, SOs, or vendors...",
                  style: TextStyle(
                    color: textGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppColors.gradient3,
                AppColors.gradient4

              ],
            ),
            color: AppColors.buttonPrimary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.tune_rounded, color: Colors.white),
        ),
      ],
    );
  }

///filter chip=================

  Widget _filterChips() {
    return SizedBox(
      height: 38,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _chip("All\nOrders", Icons.list_alt_rounded, true),
          _chip("Pending", Icons.pending_actions_rounded, false),
          _chip("Approved", Icons.verified_rounded, false),
          _chip("Delivered", Icons.local_shipping_rounded, false),
        ],
      ),
    );
  }

  Widget _chip(String label, IconData icon, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: selected ? AppColors.buttonPrimary : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: selected ? AppColors.buttonPrimary : const Color(0xFFE5E7EB),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: selected ? Colors.white : textGrey,
            size: 16,
          ),
          const SizedBox(width: 6),
          Text(
            label.replaceAll("\n", " "),
            style: TextStyle(
              color: selected ? Colors.white : textGrey,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
///value card========================
  Widget _valueCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.gradient3,

        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Value (Active)",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "\$142,500.00",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: const [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: AppColors.buttonPrimary),
              ),

            ],
          ),
          const SizedBox(width: 18),
        ],
      ),
    );
  }
///small card===========================
  Widget _smallStats() {
    return Row(
      children: [
        Expanded(child: _smallStat("Active POs", "14", Colors.blue)),
        const SizedBox(width: 10),
        Expanded(child: _smallStat("Delayed", "03", Colors.red)),
      ],
    );
  }

  Widget _smallStat(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFDDE2EA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 11, color: textDark)),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
/// recent order=============================
  Widget _recentHeader() {
    return const Row(
      children: [
        Expanded(
          child: Text(
            "Recent Orders",
            style: TextStyle(
              color: textDark,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Text(
          "Sort: Date",
          style: TextStyle(
            color: textGrey,
            fontSize: 11,
            letterSpacing: 1,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _orderList(BuildContext context) {
    final orders = [
      {
        "id": "PO-2023-9021",
        "vendor": "Symphony Electronics",
        "date": "Oct 12, 2023",
        "amount": "\$12,450.00",
        "status": "In-Process",
        "icon": Icons.receipt_long_rounded,
        "color": Colors.teal,
      },
      {
        "id": "SO-8820-211",
        "vendor": "Global Logistics Hub",
        "date": "Oct 14, 2023",
        "amount": "\$4,120.50",
        "status": "Awaiting Approval",
        "icon": Icons.description_rounded,
        "color": Colors.indigo,
      },
      {
        "id": "PO-2023-9025",
        "vendor": "Precision Parts Co.",
        "date": "Oct 11, 2023",
        "amount": "\$32,000.00",
        "status": "In-Transit",
        "icon": Icons.local_shipping_rounded,
        "color": Colors.cyan,
      },
      {
        "id": "SO-8820-215",
        "vendor": "Apex Manufacturing",
        "date": "Oct 09, 2023",
        "amount": "\$8,700.00",
        "status": "Completed",
        "icon": Icons.inventory_2_rounded,
        "color": Colors.indigoAccent,
      },
    ];

    return Column(
      children: orders.map((order) {
        final color = order["color"] as Color;

        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFDDE2EA)),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PoDetailsScreen(poId: order["id"] as String),
                ),
              );
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.16),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(order["icon"] as IconData, color: color),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order["id"] as String,
                            style: const TextStyle(
                              color: textDark,
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            order["vendor"] as String,
                            style: const TextStyle(
                              color: textGrey,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _statusBadge(order["status"] as String),
                  ],
                ),
                const SizedBox(height: 18),
                const Divider(height: 1),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _bottomInfo(
                        "ORDER DATE",
                        order["date"] as String,
                      ),
                    ),
                    Expanded(
                      child: _bottomInfo(
                        "TOTAL AMOUNT",
                        order["amount"] as String,
                        alignRight: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _statusBadge(String status) {
    Color color;

    if (status == "Awaiting Approval") {
      color = Colors.red;
    } else if (status == "Completed") {
      color = Colors.green;
    } else {
      color = Colors.teal;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 9,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _bottomInfo(String title, String value, {bool alignRight = false}) {
    return Column(
      crossAxisAlignment:
      alignRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: textGrey,
            fontSize: 9,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.buttonPrimary,
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }


}