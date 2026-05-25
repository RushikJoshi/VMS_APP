import 'package:flutter/material.dart';

class PermissionMatrixScreen extends StatefulWidget {
  final String roleName;

  const PermissionMatrixScreen({Key? key, required this.roleName}) : super(key: key);

  @override
  _PermissionMatrixScreenState createState() => _PermissionMatrixScreenState();
}

class _PermissionMatrixScreenState extends State<PermissionMatrixScreen> {
  final Map<String, List<bool>> _permissions = {
    'Dashboard & Analytics': [true, true, false, false],
    'Company Management': [true, true, true, true],
    'User Management': [true, true, true, false],
    'Vendor Monitoring': [true, true, false, false],
    'RFQ & Orders': [true, true, true, true],
    'Finance & Invoicing': [true, false, false, false],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Permissions: ${widget.roleName}', style: const TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Permissions Saved')));
            },
            child: const Text('SAVE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Card(
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.white),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text('Toggle access rights for this role across different modules.', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Table(
              border: TableBorder.all(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8)),
              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
                4: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                  children: const [
                    Padding(padding: EdgeInsets.all(12.0), child: Text('Module', style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(padding: EdgeInsets.all(12.0), child: Text('View', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                    Padding(padding: EdgeInsets.all(12.0), child: Text('Create', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                    Padding(padding: EdgeInsets.all(12.0), child: Text('Edit', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                    Padding(padding: EdgeInsets.all(12.0), child: Text('Delete', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                  ],
                ),
                ..._permissions.entries.map((e) => _buildPermissionRow(e.key, e.value)).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildPermissionRow(String module, List<bool> perms) {
    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.all(12.0), child: Text(module, style: const TextStyle(fontWeight: FontWeight.w600))),
        _buildCheckbox(module, 0, perms[0]),
        _buildCheckbox(module, 1, perms[1]),
        _buildCheckbox(module, 2, perms[2]),
        _buildCheckbox(module, 3, perms[3]),
      ],
    );
  }

  Widget _buildCheckbox(String module, int index, bool value) {
    return Checkbox(
      value: value,
      onChanged: (newVal) {
        setState(() {
          _permissions[module]![index] = newVal ?? false;
        });
      },
    );
  }
}
