import 'package:flutter/material.dart';

class PoDetailsScreen extends StatelessWidget {
  final String poId;
  const PoDetailsScreen({Key? key, required this.poId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PO Details: $poId', style: const TextStyle(fontWeight: FontWeight.bold))),
      body: const Center(child: Text('Detailed view of Purchase Order including Line Items and Shipment Tracking link.')),
    );
  }
}
