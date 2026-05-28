import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  static const Color primary = Color(0xFF1E3A8A);
  static const Color bg = Color(0xFFF4F7FC);
  static const Color darkText = Color(0xFF0F172A);
  static const Color greyText = Color(0xFF64748B);
  static const Color border = Color(0xFFE5E7EB);
  static const Color green = Color(0xFF16A34A);
  static const Color orange = Color(0xFFF59E0B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _profileHeader(),
            const SizedBox(height: 16),
            _quickStats(),
            const SizedBox(height: 16),
            _roleCard(),
            const SizedBox(height: 16),
            _personalInfoCard(),
            const SizedBox(height: 16),
            _permissionCard(),
            const SizedBox(height: 16),
            _activityCard(),
            const SizedBox(height: 24),
            _actionButtons(),
          ],
        ),
      ),
    );
  }
///profile==============================
  Widget _profileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              radius: 44,
              backgroundColor: Colors.white54,
              child: CircleAvatar(
                radius: 40,
                backgroundColor:AppColors.buttonPrimary,
                child: Icon(
                  Icons.person_rounded,
                  size: 45,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Positioned(
              right: 2,
              bottom: 4,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 14),
        const Text(
          "Tanvi Dobariya",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          "tanvi@example.com",
          style: TextStyle(color: Colors.black, fontSize: 13),
        ),
        const Text(
          "+91 9106140000",
          style: TextStyle(color: Colors.black, fontSize: 13),
        ),
        const SizedBox(height: 14),
        _statusBadge("Active User"),
      ],
    );
  }
/// state box row=====================================
  Widget _quickStats() {
    return Row(
      children: [
        _statBox("Login", "128", Icons.login_rounded),
        const SizedBox(width: 12),
        _statBox("Tasks", "24", Icons.task_alt_rounded),
        const SizedBox(width: 12),
        _statBox("Role", "Admin", Icons.admin_panel_settings_rounded),
      ],
    );
  }

  Widget _statBox(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: border),
        ),
        child: Column(
          children: [
            ///icon=======
            Icon(icon, color: AppColors.buttonPrimary),
            const SizedBox(height: 8),
            ///text========
            Text(
              value,
              style: const TextStyle(
                color: darkText,
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              title,
              style: const TextStyle(color: greyText, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
///role card==========================================
  Widget _roleCard() {
    return _card(
      title: "Role Assignment",
      child: Column(
        children: [
          _roleTile(
            icon: Icons.admin_panel_settings_rounded,
            title: "Current Role",
            value: "Super Admin",
            color: primary,
          ),
          _roleTile(
            icon: Icons.security_rounded,
            title: "Access Level",
            value: "Full Access",
            color: green,
          ),
          _roleTile(
            icon: Icons.schedule_rounded,
            title: "Assigned Date",
            value: "27 May 2026",
            color: orange,
          ),
        ],
      ),
    );
  }

  Widget _personalInfoCard() {
    return _card(
      title: "Personal Information",
      child: Column(
        children: [
          _infoRow(Icons.badge_rounded, "User ID", "USR-2026-001"),
          _infoRow(Icons.phone_rounded, "Phone", "+91 98765 43210"),
          _infoRow(Icons.location_on_rounded, "Location", "Ahmedabad, Gujarat"),
          _infoRow(Icons.work_rounded, "Department", "Vendor Management"),
          _infoRow(Icons.calendar_month_rounded, "Joined", "12 Jan 2026"),
        ],
      ),
    );
  }

  Widget _permissionCard() {
    final permissions = [
      "Vendor Approval",
      "RFQ Management",
      "Purchase Orders",
      "User Management",
      "Reports Access",
    ];

    return _card(
      title: "Permissions",
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: permissions.map((item) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFBFDBFE)),
            ),
            child: Text(
              item,
              style: const TextStyle(
                color: primary,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
      // recent activity----------------------//
  Widget _activityCard() {
    final activities = [
      {
        "title": "Logged in to the system",
        "date": "27 May 2026, 10:30 AM",
        "icon": Icons.lock_outline_rounded,
        "color": green,
        "tag": "Login",
      },
      {
        "title": "Approved Vendor – Tech Solutions Inc.",
        "date": "27 May 2026, 11:15 AM",
        "icon": Icons.check_rounded,
        "color": primary,
        "tag": "Approval",
      },
      {
        "title": "Updated RFQ – RFQ-2026-045",
        "date": "26 May 2026, 04:20 PM",
        "icon": Icons.description_outlined,
        "color": orange,
        "tag": "Update",
      },
      {
        "title": "Generated Report – Vendor Performance",
        "date": "25 May 2026, 05:10 PM",
        "icon": Icons.bar_chart_rounded,
        "color": Colors.purple,
        "tag": "Report",
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.history_rounded,
                color: primary,
                size: 22,
              ),
              const SizedBox(width: 10),
              const Text(
                "Recent Activity",
                style: TextStyle(
                  color: darkText,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "View All",
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Column(
            children: List.generate(activities.length, (index) {
              final item = activities[index];
              final color = item["color"] as Color;
              final isLast = index == activities.length - 1;

              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 17,
                          backgroundColor: color.withOpacity(0.14),
                          child: Icon(
                            item["icon"] as IconData,
                            color: color,
                            size: 17,
                          ),
                        ),
                        if (!isLast)
                          Expanded(
                            child: Container(
                              width: 1,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              color: const Color(0xFFE5EAF1),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 16),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 18),
                        margin: EdgeInsets.only(bottom: isLast ? 0 : 2),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: isLast
                                  ? Colors.transparent
                                  : const Color(0xFFE5EAF1),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["title"] as String,
                                    style: const TextStyle(
                                      color: darkText,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    item["date"] as String,
                                    style: const TextStyle(
                                      color: greyText,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                item["tag"] as String,
                                style: TextStyle(
                                  color: color,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

      //button--------------------------------//
  Widget _actionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.lock_reset_rounded),
            label: const Text("Reset"),
            style: OutlinedButton.styleFrom(
              foregroundColor: primary,
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit_rounded),
            label: const Text("Edit User"),
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _card({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: darkText,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget _roleTile({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: greyText, fontSize: 12),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: darkText,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          Icon(icon, color: primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: greyText, fontSize: 12),
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: darkText,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color:AppColors.gradient3.withOpacity(0.16),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color:AppColors.gradient3 .withOpacity(0.35)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.buttonPrimary,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}