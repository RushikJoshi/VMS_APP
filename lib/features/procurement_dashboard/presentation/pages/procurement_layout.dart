import 'package:flutter/material.dart';
import 'procurement_dashboard_tab.dart';
import '../../../../features/rfq_management/presentation/pages/rfq_dashboard_screen.dart';
import '../../../../features/purchase_orders/presentation/pages/po_list_screen.dart';
import '../../../../features/user_management/presentation/pages/user_details_screen.dart';
import '../widgets/procurement_drawer.dart';

// Missing modules that we will scaffold in Phase 2
import '../../../../features/quotation_management/presentation/pages/quotation_list_screen.dart';

class ProcurementLayout extends StatefulWidget {
  const ProcurementLayout({Key? key}) : super(key: key);

  @override
  _ProcurementLayoutState createState() => _ProcurementLayoutState();
}

class _ProcurementLayoutState extends State<ProcurementLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ProcurementDashboardTab(),
    const RfqDashboardScreen(userRole: 'ProcurementManager'),
    const QuotationListScreen(userRole: 'ProcurementManager'),
    const PoListScreen(userRole: 'ProcurementManager'),
    const UserDetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFF38BDF8).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.engineering, color: Color(0xFF0F172A), size: 20),
            ),
            const SizedBox(width: 10),
            const Text(
              'Procurement Command',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF0F172A)),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined, color: Color(0xFF475569)),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: ProcurementDrawer(
        onSelectTab: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF6366F1), // Premium indigo theme color
        unselectedItemColor: const Color(0xFF94A3B8),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined, size: 22), activeIcon: Icon(Icons.dashboard, size: 22), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.request_quote_outlined, size: 22), activeIcon: Icon(Icons.request_quote, size: 22), label: 'RFQs'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined, size: 22), activeIcon: Icon(Icons.receipt_long, size: 22), label: 'Quotations'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined, size: 22), activeIcon: Icon(Icons.shopping_cart, size: 22), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 22), activeIcon: Icon(Icons.person, size: 22), label: 'Profile'),
        ],
      ),
    );
  }
}
