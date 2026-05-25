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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Welcome Vendor! (Vendor Portal UI Pending)')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid credentials. Try superadmin@vms.com, admin@vms.com, or procurement@vms.com'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({
    required String hintText,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0xFF6B7280),
        fontSize: 14,
      ),
      prefixIcon: Icon(icon, color: Color(0xFF7FA2CC), size: 22),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: const Color(0xFFF3F6FA),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2FB),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        //margin: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF669FF1),
              //Color(0xFF1B6BF8),
              // Color(0xFF061F5A),
              Color(0xFF96ABD5),
              //Color(0xFF1E5AE0),

            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -50,
              right: -30,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white.withOpacity(0.14),
              ),
            ),
            Positioned(
              bottom: -45,
              left: -35,
              child: CircleAvatar(
                radius: 75,
                backgroundColor: Colors.white.withOpacity(0.14),
              ),
            ),

            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 54),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Text(
                  //   'Welcome Back 👋',
                  //   style: TextStyle(
                  //     fontSize: 25,
                  //     fontWeight: FontWeight.w800,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // const Text(
                  //   'Login to continue your account',
                  //   style: TextStyle(
                  //     fontSize: 13,
                  //     color: Colors.white,
                  //   ),
                  // ),

                  const SizedBox(height: 55),

                  Column(
                    children: [
                      const Text(
                        'Create your account',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF111827),
                        ),
                      ),

                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,

                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email Address (e.g., superadmin@vms.com)',
                            hintText: 'Enter your email',

                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Color(0xFF7FA2CC),
                            ),

                            filled: true,
                            fillColor: const Color(0xFFF3F6FA),

                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 18,
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                             // borderSide: BorderSide.none,
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              //borderSide: BorderSide.none,
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      SizedBox(
                        width: double.infinity,
                        child: TextField(
                          controller: _passwordController,
                          obscureText: _obscureText,

                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter password',

                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Color(0xFF7FA2CC),
                            ),

                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color(0xFF374151),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),

                            filled: true,
                            fillColor: const Color(0xFFF3F6FA),

                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 18,
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color(0xFF1E5AE0),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: _handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E5AE0),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Row(
                      //   children: const [
                      //     Expanded(child: Divider(color: Color(0xFFE5E7EB))),
                      //     Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 12),
                      //       child: Text(
                      //         'OR',
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //     ),
                      //     Expanded(child: Divider(color: Color(0xFFE5E7EB))),
                      //   ],
                      // ),

                      //const SizedBox(height: 34),

                      // _socialButton(
                      //   icon: Icons.g_mobiledata,
                      //   text: 'Continue with Googl/e',
                      // ),

                      //const SizedBox(height: 14),

                      // _socialButton(
                      //   icon: Icons.facebook,
                      //   text: 'Continue with Facebook',
                      // ),
                      //
                      // const SizedBox(height: 45),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialButton({
    required IconData icon,
    required String text,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 18),
          Icon(icon, color: const Color(0xFF8EABCC), size: 25),
          const SizedBox(width: 14),
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}