import 'package:flutter/material.dart';

class NotificationCenterScreen extends StatelessWidget {
  const NotificationCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notification Center', style: TextStyle(fontWeight: FontWeight.bold)),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Security Alerts'),
              Tab(text: 'Shipment Alerts'),
              Tab(text: 'Payment Alerts'),
              Tab(text: 'Subscription Alerts'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Security Alerts')),
            Center(child: Text('Shipment Alerts')),
            Center(child: Text('Payment Alerts')),
            Center(child: Text('Subscription Alerts')),
          ],
        ),
      ),
    );
  }
}
