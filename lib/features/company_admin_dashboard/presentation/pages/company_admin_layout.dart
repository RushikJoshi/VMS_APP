import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [

                AppColors.gradient1,
                AppColors.gradient3,
                AppColors.gradient4,

              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        title: const Row(
          children: [
///icon=================
            Icon(
              Icons.apartment,
              color: Colors.white,
            ),

            SizedBox(width: 8),
///title==================
            Text(
              'Company ERP',

              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                fontSize: 24,
              ),
            ),
          ],
        ),

        actions: [
///notification icon=========
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: AppColors.textPrimary,
            ),

            onPressed: () {},
          ),
///profile icon=======================
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              backgroundColor: AppColors.textPrimary,
              child: Icon(
                Icons.person,
                color: Color(0xFF8EABCC),
              ),
            ),
          ),
        ],
      ),
///drawer==================
      drawer: const CompanyAdminDrawer(),
 ///body=============
      body: _pages[_currentIndex],

 ///bottom nav bar=================================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor:AppColors.buttonPrimary ,
        unselectedItemColor: AppColors.textSecondary,
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
