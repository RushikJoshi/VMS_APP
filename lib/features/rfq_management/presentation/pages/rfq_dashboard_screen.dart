import 'package:flutter/material.dart';
import 'package:vms_app/data/repositories/rfq_repository.dart';
import '../../../../core/constants/app_colors.dart';
import 'rfq_details_screen.dart';

class RfqDashboardScreen extends StatefulWidget {
  final String userRole;

  const RfqDashboardScreen({
    Key? key,
    this.userRole = 'SuperAdmin',
  }) : super(key: key);

  static const Color darkText = Color(0xFF111827);
  static const Color lightText = Color(0xFF6B7280);
  static const Color primaryColor = Color(0xFF2563EB);
  static const Color bgColor = Color(0xFFF6F8FC);

  @override
  State<RfqDashboardScreen> createState() => _RfqDashboardScreenState();

///header icon================
  static Widget _headerIcon(IconData icon) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFE5E7EB)),
      ),
      child: Icon(icon, color: primaryColor),
    );
  }
}

class _RfqDashboardScreenState extends State<RfqDashboardScreen> {

bool isLoading=true;

//object==========
   final RfqRepository _rfqRepo =RfqRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRFQ();
  }

  //function create ==
  Future<void> getRFQ()async{
    try {
      final response = await _rfqRepo.getRfqList();

      print(response);
    } catch (e) {
      print(e);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RfqDashboardScreen.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topHeader(),

              const SizedBox(height: 18),

              _rfqSummaryCard(),

              const SizedBox(height: 20),

              _rfqStatusTracking(),



              const SizedBox(height: 12),

              //_statusTracking(),


              const Text(
                "Recent RFQs",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: RfqDashboardScreen.darkText,
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

///top header==========================
  Widget _topHeader() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "RFQ Dashboard",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: RfqDashboardScreen.darkText,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Create, track and manage vendor quotations",
                style: TextStyle(
                  color: RfqDashboardScreen.lightText,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        RfqDashboardScreen._headerIcon(Icons.search_rounded),
        const SizedBox(width: 10),
        RfqDashboardScreen._headerIcon(Icons.notifications_none_rounded),
      ],
    );
  }

///summarycary================
  Widget _rfqSummaryCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),

        gradient: const LinearGradient(
          colors: [
            Color(0xFF7EA1E8),
            Color(0xFF7093DE),
            Color(0xFF89A9EE),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7093DE).withOpacity(0.25),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Stack(
        children: [

          /// RIGHT CIRCLE DESIGN
          Positioned(
            right: -35,
            top: -25,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),

          /// CONTENT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// ICON BOX
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.request_quote_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                "Request For Quotation",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "Track open RFQs, closed RFQs and vendor bids.",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.78),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 22),

              Row(
                children: [
                  _summaryMini("24", "Open"),
                  _summaryMini("150", "Closed"),
                  _summaryMini("19", "Bids"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// summary card============

  Widget _summaryMini(String value, String title) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),

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
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.78),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

///quickaction=====================
  Widget _rfqStatusTracking() {
    final rfqList = [
      {
        "id": "RFQ-001",
        "title": "Laptop Requirement",
        "status": "Open",
        "progress": 0.35,
        "color": Colors.orange,
        "vendors": "8 Vendors",
        "date": "Due: 28 May",
      },
      {
        "id": "RFQ-002",
        "title": "Office Furniture",
        "status": "Under Review",
        "progress": 0.70,
        "color": Colors.blue,
        "vendors": "5 Vendors",
        "date": "Due: 30 May",
      },
      {
        "id": "RFQ-003",
        "title": "IT Services",
        "status": "Closed",
        "progress": 1.0,
        "color": Colors.green,
        "vendors": "12 Vendors",
        "date": "Closed",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "RFQ Status Tracking",
          style: TextStyle(
            color: RfqDashboardScreen.darkText,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 12),

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: rfqList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final rfq = rfqList[index];
            final color = rfq["color"] as Color;

            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFFE5E7EB)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.track_changes_rounded,
                          color: color,
                        ),
                      ),
                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rfq["id"] as String,
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              rfq["title"] as String,
                              style: const TextStyle(
                                color: RfqDashboardScreen.darkText,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          rfq["status"] as String,
                          style: TextStyle(
                            color: color,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: rfq["progress"] as double,
                      minHeight: 8,
                      backgroundColor: const Color(0xFFE5E7EB),
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Icon(
                        Icons.groups_rounded,
                        size: 18,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        rfq["vendors"] as String,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.calendar_month_rounded,
                        size: 18,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        rfq["date"] as String,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
             ///Recent RFQ================//
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

    return Column(
      children: rfqs.map((rfq) {
        final isOpen = rfq['status'] == 'Open';

        return Container(
          margin: const EdgeInsets.only(bottom: 14),
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
                    CircleAvatar(
                      radius: 27,
                      backgroundColor: isOpen
                          ? Colors.orange.withOpacity(0.12)
                          : Colors.green.withOpacity(0.12),
                      child: Icon(
                        Icons.request_quote_rounded,
                        color: isOpen ? Colors.orange : Colors.green,
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
                              //color: darkText,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${rfq['id']} • ${rfq['bids']} Bids Received',
                            style: const TextStyle(
                              //color: lightText,
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
                                  : Colors.green.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              rfq['status'] as String,
                              style: TextStyle(
                                color: isOpen ? Colors.orange : Colors.green,
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.gradient3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
