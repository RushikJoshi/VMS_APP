import 'package:flutter/material.dart';
import '../../../../features/company_admin_dashboard/presentation/pages/company_admin_layout.dart';
import '../../../../features/dashboard/presentation/pages/super_admin_layout.dart';
import '../../../../features/procurement_dashboard/presentation/pages/procurement_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    final email = _emailController.text.trim().toLowerCase();
    
    if (email == 'superadmin@vms.com') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SuperAdminLayout()));
    } else if (email == 'admin@vms.com') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CompanyAdminLayout()));
    } else if (email == 'procurement@vms.com') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProcurementLayout()));
    } else if (email == 'vendor@vms.com') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Welcome Vendor! (Vendor Portal UI Pending)')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Invalid credentials. Try superadmin@vms.com, admin@vms.com, or procurement@vms.com'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(Icons.security, size: 48, color: Colors.blue.shade900),
              ),
              const SizedBox(height: 32),
              const Text('Welcome Back', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Sign in to your ERP account.', style: TextStyle(fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 48),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address (e.g., superadmin@vms.com)',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?', style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Login securely', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
