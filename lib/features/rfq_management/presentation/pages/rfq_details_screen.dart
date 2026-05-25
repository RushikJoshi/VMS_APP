import 'package:flutter/material.dart';

class RfqDetailsScreen extends StatelessWidget {
  final String rfqId;
  const RfqDetailsScreen({Key? key, required this.rfqId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RFQ Details: $rfqId', style: const TextStyle(fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Card(
              child: ListTile(
                title: Text('Vendor Participation', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('3 Vendors have submitted bids.'),
                trailing: Icon(Icons.people),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Submitted Bids', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Card(child: ListTile(leading: const CircleAvatar(child: Text('V1')), title: const Text('Vendor 1'), subtitle: const Text('Bid: \,000'), trailing: ElevatedButton(onPressed: (){}, child: const Text('Award')))),
            Card(child: ListTile(leading: const CircleAvatar(child: Text('V2')), title: const Text('Vendor 2'), subtitle: const Text('Bid: \,500'), trailing: ElevatedButton(onPressed: (){}, child: const Text('Award')))),
          ],
        ),
      ),
    );
  }
}
