import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_drawer.dart';

// Dummy imports for tabs
import 'dashboard_tab.dart';
import 'companies_tab.dart';
import 'analytics_tab.dart';
import 'quick_actions_tab.dart';
import 'profile_tab.dart';

class SuperAdminLayout extends StatefulWidget {
  const SuperAdminLayout({Key? key}) : super(key: key);

  @override
  State<SuperAdminLayout> createState() => _SuperAdminLayoutState();
}

class _SuperAdminLayoutState extends State<SuperAdminLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardTab(),
    const CompaniesTab(),
    const AnalyticsTab(),
    const QuickActionsTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'ERP Admin'),
      drawer: const CustomDrawer(),
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Companies'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: 'Quick Actions'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
