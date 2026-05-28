import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class PaymentsScreen extends StatelessWidget {
  final String userRole;
  const PaymentsScreen({Key? key, this.userRole = 'SuperAdmin'}) : super(key: key);

  static const Color bg = Color(0xFFF4F6FA);
  static const Color textDark = Color(0xFF202431);
  static const Color textGrey = Color(0xFF6B7280);
  static const Color border = Color(0xFFD5DAE5);
  static const Color teal = Color(0xFF078B8B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bg,
        //foregroundColor: darkText,
        title: Text(
          'Payment Tracking',
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Payment Tracking",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Monitor and manage your vendor transaction\nlifecycle.",
                      style: TextStyle(
                        color: Color(0xFF565C69),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 18),
                    _tabs(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: _summaryCard()),
                        const SizedBox(width: 14),
                        Expanded(child: _batchCard()),
                      ],
                    ),
                    const SizedBox(height: 26),
                    _sectionTitle(),
                    const SizedBox(height: 14),
                    _transactionCardOne(),
                    const SizedBox(height: 18),
                    _transactionCardTwo(),
                    const SizedBox(height: 18),
                    _transactionCardThree(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _topBar() {
  //   return Container(
  //     height: 58,
  //     padding: const EdgeInsets.symmetric(horizontal: 22),
  //     decoration: const BoxDecoration(
  //       color: bg,
  //       border: Border(
  //         bottom: BorderSide(color: border),
  //       ),
  //     ),
  //     child: Row(
  //       children: [
  //         const CircleAvatar(
  //           radius: 14,
  //           backgroundColor: primary,
  //           child: Icon(Icons.track_changes_rounded, color: Colors.white, size: 16),
  //         ),
  //         const SizedBox(width: 10),
  //         const Text(
  //           "Gitakshmi",
  //           style: TextStyle(
  //             color: primary,
  //             fontSize: 17,
  //             fontWeight: FontWeight.w900,
  //           ),
  //         ),
  //         const Spacer(),
  //         IconButton(
  //           onPressed: () {},
  //           icon: const Icon(Icons.notifications_none_rounded, color: primary),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _tabs() {
    final tabs = ["All", "Processing", "Paid", "Scheduled"];

    return Container(
      height: 38,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
          )
        ],
      ),
      child: Row(
        children: tabs.map((tab) {
          final active = tab == "All";
          return Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: active ? AppColors.buttonPrimary : Colors.transparent,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Text(
                tab,
                style: TextStyle(
                  color: active ? Colors.white : const Color(0xFF555B68),
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _summaryCard() {
    return Container(
      height: 125,
      padding: const EdgeInsets.all(15),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.assignment_turned_in_outlined, color: teal, size: 22),
              const Spacer(),
              _pill("In Review", teal),
            ],
          ),
          const Spacer(),
          const Text(
            "TOTAL PROCESSING",
            style: TextStyle(
              color: textGrey,
              fontSize: 10,
              letterSpacing: 1.6,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "\$12,450.00",
            style: TextStyle(
              color: AppColors.buttonPrimary,
              fontSize: 19,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _batchCard() {
    return Container(
      height: 125,
      padding: const EdgeInsets.all(15),
      decoration: _boxDecoration(),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.event_repeat_rounded, color: AppColors.buttonPrimary, size: 24),
          Spacer(),
          Text(
            "NEXT BATCH",
            style: TextStyle(
              color: textGrey,
              fontSize: 10,
              letterSpacing: 1.6,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Oct 24, 2023",
            style: TextStyle(
              color: AppColors.buttonPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle() {
    return Row(
      children: [
        const Text(
          "Recent Transactions",
          style: TextStyle(
            color: textDark,
            fontSize: 15,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(
            "View History →",
            style: TextStyle(
              color: AppColors.buttonPrimary,
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        )
      ],
    );
  }

  Widget _transactionCardOne() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _boxDecoration(),
      child: Column(
        children: [
          Row(
            children: [
              _logoBox(Icons.layers_rounded, const Color(0xFF25485A)),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("TechLogix Systems", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                    SizedBox(height: 3),
                    Text("TXN-882910-B", style: TextStyle(color: textGrey, fontSize: 11, letterSpacing: 1)),
                  ],
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\$4,200.00", style: TextStyle(color: AppColors.buttonPrimary, fontWeight: FontWeight.w900, fontSize: 15)),
                  SizedBox(height: 4),
                  Text("🏦 Bank Transfer", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700)),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          _progressLine(),
          const SizedBox(height: 6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Initiated", style: TextStyle(color: AppColors.buttonPrimary, fontSize: 9, fontWeight: FontWeight.w800)),
              Text("Authorized", style: TextStyle(color: AppColors.buttonPrimary, fontSize: 9, fontWeight: FontWeight.w800)),
              Text("Processing", style: TextStyle(color: AppColors.buttonPrimary, fontSize: 9, fontWeight: FontWeight.w800)),
              Text("Paid", style: TextStyle(color: textGrey, fontSize: 9, fontWeight: FontWeight.w800)),
            ],
          )
        ],
      ),
    );
  }

  Widget _transactionCardTwo() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _boxDecoration(),
      child: Column(
        children: [
          Row(
            children: [
              _logoBox(Icons.local_florist_rounded, const Color(0xFF20242B)),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Velvet Bloom Agency", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                    SizedBox(height: 3),
                    Text("TXN-773412-A", style: TextStyle(color: textGrey, fontSize: 11, letterSpacing: 1)),
                  ],
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\$1,850.25", style: TextStyle(color: AppColors.buttonPrimary, fontWeight: FontWeight.w900, fontSize: 15)),
                  SizedBox(height: 4),
                  Text("💳 Digital Wallet", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700)),
                ],
              )
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              const Icon(Icons.check_circle, color: teal, size: 17),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  "Successfully Paid on Oct 18",
                  style: TextStyle(color: teal, fontSize: 11, fontWeight: FontWeight.w900),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E7EB),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "↓ Receipt",
                  style: TextStyle(color: AppColors.buttonPrimary, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _transactionCardThree() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _boxDecoration(),
      child: Row(
        children: [
          _logoBox(Icons.inventory_2_outlined, const Color(0xFFE9ECEF), iconColor: Colors.grey),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("North Star Logistics", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                SizedBox(height: 3),
                Text("TXN-449012-C", style: TextStyle(color: textGrey, fontSize: 11, letterSpacing: 1)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text("\$12,000.00", style: TextStyle(color: textDark, fontWeight: FontWeight.w900, fontSize: 14)),
              const SizedBox(height: 8),
              _pill("Scheduled: Oct 30", AppColors.buttonPrimary),
            ],
          )
        ],
      ),
    );
  }

  Widget _progressLine() {
    return Row(
      children: [
        _step(true, Icons.check),
        Expanded(child: Container(height: 2, color: AppColors.buttonPrimary)),
        _step(true, Icons.check),
        Expanded(child: Container(height: 2, color: AppColors.buttonPrimary)),
        _step(true, Icons.circle),
        Expanded(child: Container(height: 2, color: border)),
        _step(false, Icons.circle),
      ],
    );
  }

  Widget _step(bool active, IconData icon) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: active ? AppColors.buttonPrimary : const Color(0xFFE8ECF3),
      child: Icon(
        icon,
        color: active ? Colors.white : Colors.transparent,
        size: 10,
      ),
    );
  }

  Widget _logoBox(IconData icon, Color color, {Color iconColor = Colors.white}) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: iconColor, size: 22),
    );
  }

  Widget _pill(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 9,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: border),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 12,
          offset: const Offset(0, 6),
        )
      ],
    );
  }

  // Widget _bottomNav() {
  //   return Container(
  //     height: 66,
  //     decoration: const BoxDecoration(
  //       color: bg,
  //       border: Border(top: BorderSide(color: border)),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         _navItem(Icons.grid_view_rounded, "Portal", false),
  //         _navItem(Icons.add_box_outlined, "Create", false),
  //         _navItem(Icons.query_stats_rounded, "Tracking", true),
  //         _navItem(Icons.analytics_outlined, "Analytics", false),
  //       ],
  //     ),
  //   );
  // }

  // Widget _navItem(IconData icon, String title, bool active) {
  //   return Container(
  //     width: active ? 92 : 62,
  //     height: 48,
  //     decoration: BoxDecoration(
  //       color: active ? primary : Colors.transparent,
  //       borderRadius: BorderRadius.circular(28),
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Icon(icon, color: active ? Colors.white : textDark, size: 20),
  //         const SizedBox(height: 2),
  //         Text(
  //           title,
  //           style: TextStyle(
  //             color: active ? Colors.white : textDark,
  //             fontSize: 10,
  //             letterSpacing: 1,
  //             fontWeight: FontWeight.w800,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}