import 'package:flutter/material.dart';
import '../../../dashboard/presentation/pages/analytics_tab.dart';
import '../../../finance_management/presentation/pages/invoices_list_screen.dart';
import '../../../finance_management/presentation/pages/payments_screen.dart';
import '../../../grn_management/presentation/pages/grn_management_screen.dart';
import '../../../logistics/presentation/pages/shipment_dashboard_screen.dart';
import '../../../notification_center/presentation/pages/notification_center_screen.dart';
import '../../../purchase_orders/presentation/pages/po_list_screen.dart';
import '../../../rfq_management/presentation/pages/rfq_dashboard_screen.dart';
import '../../../sales_orders/presentation/pages/so_list_screen.dart';
import '../../../support_center/presentation/pages/support_center_screen.dart';
import '../../../system_settings/presentation/pages/system_settings_screen.dart';
import '../../../user_management/presentation/pages/users_list_screen.dart';
import '../../../vendor_management/presentation/pages/vendors_list_screen.dart';


class CompanyAdminDrawer extends StatelessWidget {
  const CompanyAdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            color: Colors.blue.shade900,
            width: double.infinity,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                CircleAvatar(radius: 30, backgroundColor: Colors.white, child: Icon(Icons.business, size: 30, color: Colors.blue)),
                SizedBox(height: 16),
                Text('Acme Corp', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                Text('admin@acmecorp.com', style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildNavItem(context, Icons.dashboard, 'Dashboard', () {}),
                _buildSectionHeader('PROCUREMENT'),
                _buildNavItem(context, Icons.business, 'Vendor Management', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const VendorsListScreen(userRole: 'CompanyAdmin')));
                }),
                _buildNavItem(context, Icons.request_quote, 'RFQs', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const RfqDashboardScreen(userRole: 'CompanyAdmin')));
                }),
                _buildSectionHeader('ORDERS & LOGISTICS'),
                _buildNavItem(context, Icons.shopping_cart, 'Purchase Orders', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const PoListScreen(userRole: 'CompanyAdmin')));
                }),
                _buildNavItem(context, Icons.sell, 'Sales Orders', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SoListScreen())); // userRole not added yet
                }),
                _buildNavItem(context, Icons.local_shipping, 'Shipments', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ShipmentDashboardScreen(userRole: 'CompanyAdmin')));
                }),
                _buildNavItem(context, Icons.inventory, 'GRN Management', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const GrnManagementScreen(userRole: 'CompanyAdmin')));
                }),
                _buildSectionHeader('FINANCE'),
                _buildNavItem(context, Icons.receipt, 'Invoices', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const InvoicesListScreen(userRole: 'CompanyAdmin')));
                }),
                _buildNavItem(context, Icons.payment, 'Payments', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentsScreen(userRole: 'CompanyAdmin')));
                }),
                _buildSectionHeader('ORGANIZATION'),
                _buildNavItem(context, Icons.people, 'Employees', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const UsersListScreen(userRole: 'CompanyAdmin')));
                }),
                _buildNavItem(context, Icons.analytics, 'Analytics', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const AnalyticsTab()));
                }),
                _buildSectionHeader('SYSTEM'),
                _buildNavItem(context, Icons.notifications, 'Notifications', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationCenterScreen()));
                }),
                _buildNavItem(context, Icons.support_agent, 'Support Chat', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SupportCenterScreen()));
                }),
                _buildNavItem(context, Icons.settings, 'Settings', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SystemSettingsScreen()));
                }),
              ],
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue.shade900),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      dense: true,
      onTap: onTap,
    );
  }
}
