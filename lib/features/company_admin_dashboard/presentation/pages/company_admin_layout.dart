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
        elevation: 0,

        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color(0xFFBBCFE4),
                // Color(0xFFAECFF3),
                // Color(0xFF8EABCC),
                Color(0xFF4E8DE8),
                // Color(0xFF1B6BF8),
                // Color(0xFF061F5A),
                Color(0xFF769DED),
                Color(0xFF1E5AE0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        title: const Row(
          children: [

            Icon(
              Icons.apartment,
              color: Colors.white,
            ),

            SizedBox(width: 8),

            Text(
              'Company ERP',

              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),

        actions: [

          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),

            onPressed: () {},
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),

            child: CircleAvatar(

              backgroundColor: Colors.white,

              child: Icon(
                Icons.person,
                color: Color(0xFF8EABCC),
              ),
            ),
          ),
        ],
      ),      drawer: const CompanyAdminDrawer(),
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
