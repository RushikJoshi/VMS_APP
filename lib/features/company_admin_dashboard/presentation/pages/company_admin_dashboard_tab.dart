import 'package:flutter/material.dart';
import 'package:vms_app/data/repositories/dash_repository.dart';
import 'package:vms_app/data/models/admin_stats_model.dart';
import '../../../../core/constants/app_colors.dart';

class CompanyAdminDashboardTab extends StatefulWidget {
  const CompanyAdminDashboardTab({super.key});

  @override
  State<CompanyAdminDashboardTab> createState() =>
      _CompanyAdminDashboardTabState();
}

class _CompanyAdminDashboardTabState extends State<CompanyAdminDashboardTab> {
  AdminStatsData? statsData;
  bool isLoading = true;
  final AdminService _adminService = AdminService();
  @override
  void initState() {
    getDashboardData();

    super.initState();
  }

  Future<void> getDashboardData() async {
    final response = await _adminService.getAdminStats();

    if (mounted) {
      setState(() {
        statsData = response?.data;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Dashboard Overview",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildHeroPanel(),
                    const SizedBox(height: 18),
                    _buildKpiList(),
                    const SizedBox(height: 22),
                    _title("Quick Actions"),
                    const SizedBox(height: 10),
                    _buildQuickActions(),
                    const SizedBox(height: 22),
                    _title("Procurement Trends"),
                    const SizedBox(height: 10),
                    _buildGraphCard(),
                    const SizedBox(height: 22),
                    _title("Recent Activities"),
                    const SizedBox(height: 10),
                    _activityPanel(),
                  ],
                ),
              ),
            ),
    );
  }

  ///Erp performance==================
  Widget _buildHeroPanel() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.gradient3,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.25),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -30,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white.withOpacity(0.10),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.analytics_rounded,
                color: Colors.white,
                size: 34,
              ),
              const SizedBox(height: 18),
              const Text(
                "ERP Performance",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Vendors, RFQs, orders and payments are monitored from here.",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.80),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  _heroMini("${statsData?.totalVendors ?? 0}", "Vendors"),
                  _heroMini("${statsData?.pendingApprovals ?? 0}", "Pending"),
                  _heroMini("${statsData?.activeContracts ?? 0}", "Contracts"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///Erp=====
  Widget _heroMini(String value, String title) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.14),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.75),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKpiList() {
    final items = [
      (
        "Total Vendors",
        "${statsData?.totalVendors ?? 0}",
        Icons.business,
        Colors.indigo,
      ),
      (
        "Pending",
        "${statsData?.pendingApprovals ?? 0}",
        Icons.pending_actions,
        Colors.orange,
      ),
      (
        "Blacklisted",
        "${statsData?.blacklisted ?? 0}",
        Icons.block,
        Colors.red,
      ),
      (
        "Contracts",
        "${statsData?.activeContracts ?? 0}",
        Icons.assignment,
        Colors.blue,
      ),
      (
        "Expiring Soon",
        "${statsData?.expiringSoon ?? 0}",
        Icons.warning,
        Colors.teal,
      ),
      (
        "Low Risk",
        "${statsData?.riskStats.low ?? 0}",
        Icons.verified,
        Colors.green,
      ),
    ];

    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final item = items[i];

          return Container(
            width: 150,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),

              /// 🌈 gradient background (premium look)
              gradient: LinearGradient(
                colors: [Colors.white, (item.$4 as Color).withOpacity(0.08)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),

              /// shadow
              boxShadow: [
                BoxShadow(
                  color: (item.$4 as Color).withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],

              border: Border.all(color: (item.$4 as Color).withOpacity(0.15)),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ICON
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: (item.$4 as Color).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(item.$3, color: item.$4, size: 22),
                ),

                const Spacer(),

                /// VALUE
                Text(
                  item.$2,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827),
                  ),
                ),

                const SizedBox(height: 2),

                /// TITLE
                Text(
                  item.$1,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ///================= QUICK ACTIONS =================
  Widget _buildQuickActions() {
    final actions = [
      ("Add Vendor", Icons.business),
      ("RFQ", Icons.request_quote),
      ("PO", Icons.receipt),
      ("Invoice", Icons.payment),
      ("Analytics", Icons.bar_chart),
    ];

    return SizedBox(
      height: 105,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: actions.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = actions[index];

          return Container(
            width: 115,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: AppColors.gradient3.withOpacity(0.25)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.gradient3.withOpacity(0.12),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: AppColors.gradient3.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(item.$2, color: AppColors.gradient3, size: 22),
                ),

                const SizedBox(height: 10),

                Text(
                  item.$1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// ================= CHART =================
  ///graph==============
  Widget _buildGraphCard() {
    return Container(
      height: 260,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),

          Row(
            children: [
              const Expanded(
                child: Text(
                  "Monthly spending overview",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.gradient3.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "2026",
                  style: TextStyle(
                    color: AppColors.gradient3,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _bar(70, "Jan"),
                _bar(120, "Feb"),
                _bar(85, "Mar"),
                _bar(155, "Apr"),
                _bar(120, "May"),
                _bar(195, "Jun"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///bar function=====================
  Widget _bar(double height, String month) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 22,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.gradient3.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 22,

                    ///dynamic height using========
                    height: height,

                    decoration: BoxDecoration(
                      color: AppColors.gradient3,
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            month,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  ///timeline==================
  Widget _activityPanel() {
    final activities = [
      [
        "Vendor Registered",
        "Tech Solutions Inc. joined the platform.",
        Icons.person_add,
        Colors.blue,
        "10 mins ago",
      ],
      [
        "RFQ Created",
        "RFQ-2023-089 for 50 Laptops published.",
        Icons.request_quote,
        Colors.orange,
        "1 hour ago",
      ],
      [
        "Shipment Delivered",
        "SHP-99042 delivered to Mumbai Hub.",
        Icons.local_shipping,
        Colors.teal,
        "3 hours ago",
      ],
      [
        "Invoice Approved",
        "INV-5502 approved by Finance.",
        Icons.receipt,
        Colors.green,
        "5 hours ago",
      ],
      [
        "Payment Released",
        "₹2,50,000 paid to Office Supplies Ltd.",
        Icons.payment,
        Colors.red,
        "1 day ago",
      ],
    ];

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent Activities",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 14),
          ...activities.map((item) {
            return _activityTile(
              item[0] as String,
              item[1] as String,
              item[2] as IconData,
              item[3] as Color,
              item[4] as String,
            );
          }),
        ],
      ),
    );
  }

  Widget _activityTile(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    String time,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.10),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  ),
                ),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Text(
            time,
            style: const TextStyle(
              color: AppColors.buttonPrimary,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _title(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
