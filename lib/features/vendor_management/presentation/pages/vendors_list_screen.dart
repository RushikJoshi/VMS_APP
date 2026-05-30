import 'package:flutter/material.dart';
import 'package:vms_app/data/repositories/vendor_list_repository.dart';
import '../../../../core/constants/app_colors.dart';
import 'vendor_details_screen.dart';
import 'package:vms_app/data/models/admin_vendor_list_model.dart';

class VendorsListScreen extends StatefulWidget {
  final String userRole;

  const VendorsListScreen({
    Key? key,
    this.userRole = 'SuperAdmin',
  }) : super(key: key);

  static const Color darkText = Color(0xFF111827);
  static const Color primaryColor = Color(0xFF2563EB);

  @override
  State<VendorsListScreen> createState() => _VendorsListScreenState();
}

class _VendorsListScreenState extends State<VendorsListScreen> {
  bool isLoading = true;
  List<VendorData> vendors = [];//model object


//object
  final VendorListRepository _vendorRepository = VendorListRepository();

  @override
  void initState() {
    super.initState();
    getVendorList();
  }
//function
  Future<void> getVendorList() async {
    final response = await _vendorRepository.getVendors();

    if (mounted) {
      setState(() {
        vendors = response?.data ?? [];
        isLoading = false;
      });
    }
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
      case 'approved':
        return Colors.green;
      case 'suspended':
        return Colors.red;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.blueGrey;
    }
  }

  int get approvedCount {
    return vendors.where((v) {
      final status = (['status'] ?? '').toString().toLowerCase();
      return status == 'approved' || status == 'active';
    }).length;
  }

  int get pendingCount {
    return vendors.where((v) {
      final status = (['status'] ?? '').toString().toLowerCase();
      return status == 'pending';
    }).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// SEARCH BAR
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
                gradient: const LinearGradient(
                  colors: [
                    Colors.white,
                    Color(0xFFD2DBF3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Vendors...',
                        hintStyle: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: VendorsListScreen.primaryColor,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF4F7FC),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.gradient3,
                          AppColors.gradient4,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.filter_list_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// SUMMARY CARD
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _summaryCard(
                  "Total",
                  vendors.length.toString(),
                  Icons.groups_rounded,
                ),
                const SizedBox(width: 10),
                _summaryCard(
                  "Active",
                  approvedCount.toString(),
                  Icons.verified_rounded,
                ),
                const SizedBox(width: 10),
                _summaryCard(
                  "Pending",
                  pendingCount.toString(),
                  Icons.pending_actions_rounded,
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Expanded(
            child: vendors.isEmpty
                ? const Center(
              child: Text(
                "No vendors found",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
                : ListView.builder(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: vendors.length,
              itemBuilder: (context, index) {
                return _buildVendorCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColors.textPrimary,
              AppColors.summeryCard,
            ],
          ),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white),
        ),
        child: Column(
          children: [
            Icon(icon, color: VendorsListScreen.primaryColor, size: 22),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                color: VendorsListScreen.darkText,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
///vendor card-------------------------------------------------///
  Widget _buildVendorCard(BuildContext context, int index) {
    final vendor = vendors[index];

    final companyName = vendor.companyName;
    final email = vendor.email;
    final status = vendor.status;
    final phone = vendor.phone;
    final rating = vendor.rating;
    final orders = vendor.totalOrders;




    final color = _statusColor(status.toString());

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            AppColors.summerygredient1,
            AppColors.summerygredient2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
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
                builder: (_) => VendorDetailsScreen(
                  vendorName: companyName.toString(),
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.gradient3,
                        AppColors.gradient4,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.storefront_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        companyName.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          color: VendorsListScreen.darkText,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        email.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B7280),
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$rating Rating',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF6B7280),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Icon(
                            Icons.shopping_cart_rounded,
                            color: Colors.grey[600],
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$orders Orders',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF6B7280),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          Icon(
                            Icons.phone_rounded,
                            color: Colors.grey[600],
                            size: 15,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              phone.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF6B7280),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          status.toString().toUpperCase(),
                          style: TextStyle(
                            color: color,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
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
  }
}