import 'package:flutter/material.dart';

class SubscriptionDetailsScreen extends StatelessWidget {
  const SubscriptionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subscription Details', style: TextStyle(fontWeight: FontWeight.bold))),
      body: const Center(child: Text('Upgrade/Downgrade and Billing History UI')),
    );
  }
}
