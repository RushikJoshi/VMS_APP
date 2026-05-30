import 'package:flutter/material.dart';

class SoListScreen extends StatelessWidget {
  final String userRole;

  const SoListScreen({
    Key? key,
    this.userRole = 'SuperAdmin',
  }) : super(key: key);

  final List<Map<String, dynamic>> salesOrders = const [
    {
      "soNo": "SO-2026-001",
      "customer": "ABC Industries",
      "date": "30 May 2026",
      "amount": "₹1,20,000",
      "status": "Pending",
    },
    {
      "soNo": "SO-2026-002",
      "customer": "Tech Solutions",
      "date": "28 May 2026",
      "amount": "₹2,50,000",
      "status": "Approved",
    },
    {
      "soNo": "SO-2026-003",
      "customer": "Global Traders",
      "date": "25 May 2026",
      "amount": "₹85,000",
      "status": "Delivered",
    },
  ];

  Color _statusColor(String status) {
    switch (status) {
      case "Approved":
        return Colors.green;
      case "Delivered":
        return Colors.blue;
      case "Pending":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text(
          'Sales Orders',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF2563EB),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          "Create SO",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CreateSoScreen(),
            ),
          );
        },
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: salesOrders.length,
        itemBuilder: (context, index) {
          final order = salesOrders[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SoDetailsScreen(order: order),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: Color(0xFFEAF2FF),
                        child: Icon(
                          Icons.receipt_long,
                          color: Color(0xFF2563EB),
                        ),
                      ),
                      const SizedBox(width: 12),

                      Expanded(
                        child: Text(
                          order["soNo"],
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _statusColor(order["status"]).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          order["status"],
                          style: TextStyle(
                            color: _statusColor(order["status"]),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Text(
                    order["customer"],
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF374151),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 6),
                      Text(order["date"]),

                      const Spacer(),

                      Text(
                        order["amount"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF111827),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CreateSoScreen extends StatefulWidget {
  const CreateSoScreen({Key? key}) : super(key: key);

  @override
  State<CreateSoScreen> createState() => _CreateSoScreenState();
}

class _CreateSoScreenState extends State<CreateSoScreen> {
  final customerController = TextEditingController();
  final productController = TextEditingController();
  final quantityController = TextEditingController();
  final amountController = TextEditingController();

  String status = "Pending";

  Widget _textField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: const Color(0xFF2563EB)),
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    customerController.dispose();
    productController.dispose();
    quantityController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text(
          "Create Sales Order",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            _textField(
              label: "Customer Name",
              controller: customerController,
              icon: Icons.person,
            ),
            _textField(
              label: "Product Name",
              controller: productController,
              icon: Icons.inventory_2,
            ),
            _textField(
              label: "Quantity",
              controller: quantityController,
              icon: Icons.numbers,
              keyboardType: TextInputType.number,
            ),
            _textField(
              label: "Total Amount",
              controller: amountController,
              icon: Icons.currency_rupee,
              keyboardType: TextInputType.number,
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: status,
                  isExpanded: true,
                  items: ["Pending", "Approved", "Delivered", "Cancelled"]
                      .map(
                        (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      status = value!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Sales Order Created Successfully"),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  "Save Sales Order",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SoDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> order;

  const SoDetailsScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  Widget _infoTile(String title, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF2563EB)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _trackingStep(String title, bool completed) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor:
          completed ? const Color(0xFF2563EB) : Colors.grey.shade300,
          child: completed
              ? const Icon(Icons.check, color: Colors.white, size: 16)
              : null,
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: completed ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool approved =
        order["status"] == "Approved" || order["status"] == "Delivered";

    final bool delivered = order["status"] == "Delivered";

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text(
          "Sales Order Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF2563EB),
                    Color(0xFF60A5FA),
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order["soNo"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    order["customer"],
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    order["amount"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _infoTile("Order Date", order["date"], Icons.calendar_today),
            _infoTile("Customer", order["customer"], Icons.person),
            _infoTile("Amount", order["amount"], Icons.currency_rupee),
            _infoTile("Status", order["status"], Icons.verified),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Order Tracking",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 18),

                  _trackingStep("Sales Order Created", true),

                  const SizedBox(height: 18),

                  _trackingStep("Order Approved", approved),

                  const SizedBox(height: 18),

                  _trackingStep("Order Delivered", delivered),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}