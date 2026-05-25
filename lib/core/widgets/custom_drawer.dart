import 'package:flutter/material.dart';

import '../../features/subscription_management/presentation/pages/subscriptions_list_screen.dart';
import '../../features/user_management/presentation/pages/users_list_screen.dart';
import '../../features/vendor_management/presentation/pages/vendors_list_screen.dart';
import '../../features/rfq_management/presentation/pages/rfq_dashboard_screen.dart';
import '../../features/logistics/presentation/pages/shipment_dashboard_screen.dart';
import '../../features/finance_management/presentation/pages/invoices_list_screen.dart';
import '../../features/finance_management/presentation/pages/payments_screen.dart';
import '../../features/role_management/presentation/pages/roles_list_screen.dart';
import '../../features/purchase_orders/presentation/pages/po_list_screen.dart';
import '../../features/sales_orders/presentation/pages/so_list_screen.dart';
import '../../features/grn_management/presentation/pages/grn_management_screen.dart';
import '../../features/security_center/presentation/pages/security_dashboard_screen.dart';
import '../../features/system_settings/presentation/pages/system_settings_screen.dart';

import '../../features/support_center/presentation/pages/support_center_screen.dart';
import '../../features/system_settings/presentation/pages/backup_restore_screen.dart';
import '../../features/dashboard/presentation/pages/super_admin_layout.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Super Admin Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          _buildItem(Icons.dashboard, 'Dashboard', onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const SuperAdminLayout()), (route) => false);
          }),
          _buildItem(Icons.business, 'Companies', onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const SuperAdminLayout()), (route) => false);
          }),
          _buildItem(Icons.card_membership, 'Subscriptions', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SubscriptionsListScreen()));
          }),
          _buildItem(Icons.people, 'Users', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const UsersListScreen()));
          }),
          _buildItem(Icons.security, 'Roles & Permissions', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const RolesListScreen()));
          }),
          _buildItem(Icons.store, 'Vendors', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const VendorsListScreen()));
          }),
          _buildItem(Icons.request_quote, 'RFQs', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const RfqDashboardScreen()));
          }),
          _buildItem(Icons.shopping_cart, 'Purchase Orders', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const PoListScreen()));
          }),
          _buildItem(Icons.sell, 'Sales Orders', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SoListScreen()));
          }),
          _buildItem(Icons.local_shipping, 'Shipments', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ShipmentDashboardScreen()));
          }),
          _buildItem(Icons.inventory, 'GRN Management', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const GrnManagementScreen()));
          }),
          _buildItem(Icons.receipt, 'Invoices', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const InvoicesListScreen()));
          }),
          _buildItem(Icons.payment, 'Payments', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentsScreen()));
          }),
          _buildItem(Icons.analytics, 'Analytics', onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const SuperAdminLayout()), (route) => false);
          }),
          _buildItem(Icons.support_agent, 'Support Center', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SupportCenterScreen()));
          }),
          _buildItem(Icons.admin_panel_settings, 'Security Center', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SecurityDashboardScreen()));
          }),
          _buildItem(Icons.backup, 'Backup & Restore', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const BackupRestoreScreen()));
          }),
          _buildItem(Icons.settings, 'System Settings', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SystemSettingsScreen()));
          }),
          const Divider(),
          _buildItem(Icons.person, 'Profile', onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const SuperAdminLayout()), (route) => false);
          }),
          _buildItem(Icons.logout, 'Logout', color: Colors.red, onTap: () {
            // Usually logs out, maybe pop to root
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Logged out!')));
          }),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String title, {Color? color, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      onTap: onTap ?? () {},
    );
  }
}
