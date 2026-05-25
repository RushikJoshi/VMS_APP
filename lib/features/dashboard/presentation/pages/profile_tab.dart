import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Center(
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person, size: 64, color: Colors.white),
          ),
        ),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            'Super Admin',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const Center(
          child: Text(
            'admin@vms-enterprise.com',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 32),
        _buildProfileOption(Icons.person_outline, 'Personal Info'),
        _buildProfileOption(Icons.lock_outline, 'Change Password'),
        _buildProfileOption(Icons.security, 'Security Settings'),
        const Divider(height: 32),
        _buildProfileOption(Icons.logout, 'Logout', color: Colors.red),
      ],
    );
  }

  Widget _buildProfileOption(IconData icon, String title, {Color? color}) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (color ?? Colors.blue).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color ?? Colors.blue),
      ),
      title: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
