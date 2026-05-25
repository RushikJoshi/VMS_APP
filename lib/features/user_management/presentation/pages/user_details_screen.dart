import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile', style: TextStyle(fontWeight: FontWeight.bold))),
      body: const Center(child: Text('User Profile, Role Assignment, User Activity UI')),
    );
  }
}
