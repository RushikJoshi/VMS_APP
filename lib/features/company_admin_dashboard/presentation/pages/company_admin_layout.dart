import 'package:flutter/material.dart';
import 'company_admin_dashboard_tab.dart';
import '../../../vendor_management/presentation/pages/vendors_list_screen.dart';
import '../../../rfq_management/presentation/pages/rfq_dashboard_screen.dart';
import '../../../purchase_orders/presentation/pages/po_list_screen.dart';
import '../../../user_management/presentation/pages/user_details_screen.dart';
import '../widgets/company_admin_drawer.dart';

class CompanyAdminLayout extends StatefulWidget {
  const CompanyAdminLayout({Key? key}) : super(key: key);

  @override
  _CompanyAdminLayoutState createState() => _CompanyAdminLayoutState();
}

class _CompanyAdminLayoutState extends State<CompanyAdminLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const CompanyAdminDashboardTab(),
    const VendorsListScreen(userRole: 'CompanyAdmin'),
    const RfqDashboardScreen(userRole: 'CompanyAdmin'),
    const PoListScreen(userRole: 'CompanyAdmin'),
    const UserDetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.apartment, color: Colors.blue),
            SizedBox(width: 8),
            Text('Company ERP', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      drawer: const CompanyAdminDrawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Vendors'),
          BottomNavigationBarItem(icon: Icon(Icons.request_quote), label: 'RFQs'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
