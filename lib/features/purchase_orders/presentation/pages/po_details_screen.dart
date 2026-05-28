import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class PoDetailsScreen extends StatelessWidget {
  final String poId;
  const PoDetailsScreen({Key? key, required this.poId}) : super(key: key);

 // static const Color primary = Color(0xFF1E3A8A);
  static const Color bg = Color(0xFFF4F7FC);
  static const Color darkText = Color(0xFF0F172A);
  static const Color greyText = Color(0xFF64748B);
  static const Color border = Color(0xFFE5E7EB);
  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bg,
        foregroundColor: darkText,
        title: Text(
          'PO Details',
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _headerCard(),
            const SizedBox(height: 16),
            _statusTimeline(),
            const SizedBox(height: 16),
            _vendorCard(),
            const SizedBox(height: 16),
            _itemsCard(),
            const SizedBox(height: 16),
            _amountSummary(),
            const SizedBox(height: 16),
            _shipmentCard(),
            const SizedBox(height: 24),
            _actionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _headerCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.gradient3,

        // gradient: const LinearGradient(
        //   colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
        // ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.buttonPrimary.withOpacity(0.25),
            blurRadius: 18,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _statusBadge("Approved", Colors.white, success),
          const SizedBox(height: 14),
          Text(
            poId,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Purchase Order for office supplies and hardware material",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              _headerInfo("Order Date", "27 May 2026"),
              _headerInfo("Delivery", "02 Jun 2026"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerInfo(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.14),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.white70, fontSize: 11)),
            const SizedBox(height: 5),
            Text(value,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)),
          ],
        ),
      ),
    );
  }
///order progress=================
  Widget _statusTimeline() {
    final steps = [
      ["Created", Icons.edit_document],
      ["Approved", Icons.verified],
      ["Shipped", Icons.local_shipping],
      ["Delivered", Icons.check_circle],
    ];

    return _card(
      title: "Order Progress",
      child: Row(
        children: List.generate(steps.length, (index) {
          final active = index < 2;
          return Expanded(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: active ? AppColors.buttonPrimary : border,
                  child: Icon(
                    steps[index][1] as IconData,
                    size: 17,
                    color: active ? Colors.white : greyText,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  steps[index][0] as String,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: active ? darkText : greyText,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
///vendor detail========================================================
  Widget _vendorCard() {
    return _card(
      title: "Vendor Details",
      child: Column(
        children: [
          _infoRow(Icons.business_rounded, "Vendor Name", "Tech Solutions Inc."),
          _infoRow(Icons.email_rounded, "Email", "vendor@example.com"),
          _infoRow(Icons.phone_rounded, "Phone", "+91 98765 43210"),
          _infoRow(Icons.location_on_rounded, "Address", "Ahmedabad, Gujarat"),
        ],
      ),
    );
  }
/// line item ============================
  Widget _itemsCard() {
    final items = [
      ["Laptop Stand", "10", "₹1,200", "₹12,000"],
      ["Wireless Mouse", "15", "₹650", "₹9,750"],
      ["Keyboard", "10", "₹900", "₹9,000"],
    ];

    return _card(
      title: "Line Items",
      child: Column(
        children: items.map((item) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: border),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFFEFF6FF),
                  child: Icon(Icons.inventory_2_rounded, color: AppColors.buttonPrimary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item[0],
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: darkText,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Qty: ${item[1]}", style: const TextStyle(color: greyText, fontSize: 12)),
                    const SizedBox(height: 4),
                    Text(item[3],
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, color: darkText)),
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
/// amount summary=======================================
  Widget _amountSummary() {
    return _card(
      title: "Amount Summary",
      child: Column(
        children: [
          _amountRow("Sub Total", "₹30,750"),
          _amountRow("GST 18%", "₹5,535"),
          _amountRow("Shipping", "₹500"),
          const Divider(height: 24),
          _amountRow("Grand Total", "₹36,785", isTotal: true),
        ],
      ),
    );
  }
///shipment tracking===============
  Widget _shipmentCard() {
    return _card(
      title: "Shipment Tracking",
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFBEB),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFFDE68A)),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xFFFEF3C7),
              child: Icon(Icons.local_shipping_rounded, color: warning),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Shipment Pending",
                      style: TextStyle(fontWeight: FontWeight.w900, color: darkText)),
                  SizedBox(height: 4),
                  Text("Tracking link will be available after dispatch.",
                      style: TextStyle(fontSize: 12, color: greyText)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, size: 16, color: greyText),
          ],
        ),
      ),
    );
  }
/// button===============================================
  Widget _actionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download_rounded),
            label: const Text("Download"),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.buttonPrimary,
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: AppColors.buttonPrimary),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.check_circle_rounded),
            label: const Text("Approve"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonPrimary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
          Text(title,
              style: const TextStyle(
                  color: darkText, fontSize: 16, fontWeight: FontWeight.w900)),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          Icon(icon, color: AppColors.buttonPrimary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(title,
                style: const TextStyle(color: greyText, fontSize: 12)),
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

  Widget _amountRow(String title, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isTotal ? darkText : greyText,
              fontSize: isTotal ? 16 : 13,
              fontWeight: isTotal ? FontWeight.w900 : FontWeight.w600,
            ),
          ),
          const Spacer(),
          Text(
            amount,
            style: TextStyle(
              color: isTotal ? AppColors.buttonPrimary : darkText,
              fontSize: isTotal ? 18 : 13,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusBadge(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.95),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}