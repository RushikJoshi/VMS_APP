import 'package:flutter/material.dart';
import '../../features/notification_center/presentation/pages/notification_center_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Icon(Icons.business, color: Colors.blue), // Company Logo Placeholder
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationCenterScreen()));
          },
        ),
        IconButton(
          icon: const CircleAvatar(
            radius: 14,
            child: Icon(Icons.person, size: 16),
          ),
          onPressed: () {
            // Navigate to Profile
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
