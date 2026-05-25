import 'package:flutter/material.dart';
import '../../../../features/vendor_management/presentation/pages/vendors_list_screen.dart';
import '../../../../features/rfq_management/presentation/pages/rfq_dashboard_screen.dart';
import '../../../../features/purchase_orders/presentation/pages/po_list_screen.dart';
import '../../../../features/sales_orders/presentation/pages/so_list_screen.dart';
import '../../../../features/logistics/presentation/pages/shipment_dashboard_screen.dart';
import '../../../../features/grn_management/presentation/pages/grn_management_screen.dart';
import '../../../../features/dashboard/presentation/pages/analytics_tab.dart';
import '../../../../features/notification_center/presentation/pages/notification_center_screen.dart';
import '../../../../features/support_center/presentation/pages/support_center_screen.dart';
import '../../../../features/system_settings/presentation/pages/system_settings_screen.dart';
import '../../../../features/user_management/presentation/pages/user_details_screen.dart';

// Missing modules that we will scaffold in Phase 2
import '../../../../features/quotation_management/presentation/pages/quotation_list_screen.dart';
import '../../../../features/quotation_management/presentation/pages/quotation_comparison_screen.dart';
import '../../../../features/contract_management/presentation/pages/contract_list_screen.dart';

class ProcurementDrawer extends StatelessWidget {
  final Function(int)? onSelectTab;
  const ProcurementDrawer({Key? key, this.onSelectTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0F172A), // Premium Dark Slate
      child: Column(
        children: [
          // Elegant Drawer Header with profile card
          _buildDrawerHeader(context),
          
          // Scrollable navigation list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildNavItem(context, Icons.dashboard, 'Dashboard Overview', () {
                  Navigator.pop(context); // Close drawer
                  if (onSelectTab != null) {
                    onSelectTab!(0); // Switch to Dashboard tab
                  }
                }),
                
                _buildSectionHeader('VENDOR RELATIONSHIPS'),
                _buildNavItem(context, Icons.business, 'Vendor Directory', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const VendorsListScreen(userRole: 'ProcurementManager')));
                }),
                _buildNavItem(context, Icons.verified_user, 'Vendor Verification', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const VendorsListScreen(userRole: 'ProcurementManager')));
                }),

                _buildSectionHeader('PROCUREMENT PIPELINE'),
                _buildNavItem(context, Icons.request_quote, 'RFQ Operations', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const RfqDashboardScreen(userRole: 'ProcurementManager')));
                }),
                _buildNavItem(context, Icons.receipt_long, 'Vendor Quotations', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const QuotationListScreen(userRole: 'ProcurementManager')));
                }),
                _buildNavItem(context, Icons.compare, 'Quotation Comparison', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const QuotationComparisonScreen(userRole: 'ProcurementManager')));
                }),

                _buildSectionHeader('COMMERCIALS & LOGISTICS'),
                _buildNavItem(context, Icons.shopping_cart, 'Purchase Orders', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const PoListScreen(userRole: 'ProcurementManager')));
                }),
                _buildNavItem(context, Icons.sell, 'Sales Orders', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SoListScreen(userRole: 'ProcurementManager')));
                }),
                _buildNavItem(context, Icons.description, 'Contracts & Agreements', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ContractListScreen(userRole: 'ProcurementManager')));
                }),
                _buildNavItem(context, Icons.local_shipping, 'Shipment Tracking', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ShipmentDashboardScreen(userRole: 'ProcurementManager')));
                }),
                _buildNavItem(context, Icons.inventory, 'GRN Verification', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const GrnManagementScreen(userRole: 'ProcurementManager')));
                }),

                _buildSectionHeader('BUSINESS INTELLIGENCE'),
                _buildNavItem(context, Icons.analytics, 'Procurement Analytics', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        appBar: AppBar(
                          title: const Text('Procurement Analytics', style: TextStyle(fontWeight: FontWeight.bold)),
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF0F172A),
                          elevation: 1,
                        ),
                        body: const AnalyticsTab(),
                      ),
                    ),
                  );
                }),
                _buildNavItem(context, Icons.notifications, 'Notification Hub', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationCenterScreen()));
                }),

                _buildSectionHeader('SUPPORT & PROFILE'),
                _buildNavItem(context, Icons.support_agent, 'Procurement Helpdesk', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SupportCenterScreen()));
                }),
                _buildNavItem(context, Icons.settings, 'System Settings', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SystemSettingsScreen()));
                }),
              ],
            ),
          ),
          
          const Divider(height: 1, color: Color(0xFF334155)),
          
          // Beautiful Logout section
          _buildLogoutTile(context),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, bottom: 24, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF1E293B), // Dark slate secondary
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF38BDF8).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.engineering,
                  size: 28,
                  color: Color(0xFF38BDF8),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'VMS Portal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const UserDetailsScreen()));
                },
                child: const CircleAvatar(
                  radius: 26,
                  backgroundColor: Color(0xFF38BDF8),
                  child: Icon(Icons.person, size: 28, color: Color(0xFF0F172A)),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mayur bhai',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'procurement@vms.com',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Color(0xFF64748B), // Slate muted color
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF94A3B8), size: 20),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFE2E8F0),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        dense: true,
        horizontalTitleGap: 8,
        onTap: onTap,
        hoverColor: const Color(0xFF1E293B),
      ),
    );
  }

  Widget _buildLogoutTile(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A),
      child: ListTile(
        leading: const Icon(Icons.logout, color: Color(0xFFEF4444), size: 20),
        title: const Text(
          'Logout securely',
          style: TextStyle(
            color: Color(0xFFEF4444),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        dense: true,
        horizontalTitleGap: 8,
        onTap: () {
          // Clear routes and pop back to login
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
      ),
    );
  }
}
