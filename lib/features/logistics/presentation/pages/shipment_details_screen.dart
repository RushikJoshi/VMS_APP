import 'package:flutter/material.dart';

class ShipmentDetailsScreen extends StatelessWidget {
  final String shipmentId;
  const ShipmentDetailsScreen({Key? key, required this.shipmentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shipment: $shipmentId', style: const TextStyle(fontWeight: FontWeight.bold))),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(leading: Icon(Icons.check_circle, color: Colors.green), title: Text('Order Placed')),
          ListTile(leading: Icon(Icons.check_circle, color: Colors.green), title: Text('Dispatched')),
          ListTile(leading: Icon(Icons.local_shipping, color: Colors.blue), title: Text('In Transit')),
          ListTile(leading: Icon(Icons.radio_button_unchecked, color: Colors.grey), title: Text('Delivered')),
        ],
      ),
    );
  }
}
