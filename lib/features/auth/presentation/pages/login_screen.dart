import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../features/company_admin_dashboard/presentation/pages/company_admin_layout.dart';
import '../../../../features/dashboard/presentation/pages/super_admin_layout.dart';
import '../../../../features/procurement_dashboard/presentation/pages/procurement_layout.dart';

// aa path tamara auth_service.dart file mujab change karjo
//import '../../../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  Future<void> _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter email and password'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final result = await _authService.login(
      email: email,
      password: password,
    );

    setState(() {
      _isLoading = false;
    });

    if (result['success'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message'] ?? 'Login successful'),
          backgroundColor: Colors.green,
        ),
      );

      // temporary role navigation by email
      if (email.toLowerCase().contains('admin')) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SuperAdminLayout()),
        );
      } else if (email.toLowerCase().contains('procurement')) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProcurementLayout()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SuperAdminLayout()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message'] ?? 'Login failed'),
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
    required String labelText,
    required String hintText,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0xFF6B7280),
        fontSize: 14,
      ),
      prefixIcon: Icon(icon, color: const Color(0xFF7FA2CC), size: 22),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: const Color(0xFFF3F6FA),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      border: OutlineInputBorder(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth >= 600;

    return Scaffold(
      backgroundColor: const Color(0xFFEAF2FB),
      body: Container(
        width: double.infinity,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF669FF1),
              Color(0xFF96ABD5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -screenHeight * 0.06,
              right: -screenWidth * 0.08,
              child: CircleAvatar(
                radius: isTablet ? 120 : 80,
                backgroundColor: Colors.white.withOpacity(0.14),
              ),
            ),
            Positioned(
              bottom: -screenHeight * 0.05,
              left: -screenWidth * 0.09,
              child: CircleAvatar(
                radius: isTablet ? 110 : 75,
                backgroundColor: Colors.white.withOpacity(0.14),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? screenWidth * 0.10 : 21,
                  vertical: screenHeight * 0.02,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: screenHeight - MediaQuery.of(context).padding.top,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/g.png',
                          height: isTablet ? 150 : 120,
                          width: isTablet ? 150 : 120,
                        ),

                        SizedBox(height: screenHeight * 0.04),

                        Text(
                          'Vendor Management System',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: isTablet ? 32 : 25,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.012),

                        Text(
                          'Sign in to continue your career journey.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: isTablet ? 18 : 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.black26,
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.035),

                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: _inputDecoration(
                            labelText: 'Email Address',
                            hintText: 'Enter your email',
                            icon: Icons.email_outlined,
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.028),

                        TextField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: _inputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter password',
                            icon: Icons.lock_outline,
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
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: AppColors.buttonPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.01),

                        SizedBox(
                          width: double.infinity,
                          height: isTablet ? 62 : 54,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.buttonPrimary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: _isLoading
                                ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            )
                                : Text(
                              'Login',
                              style: TextStyle(
                                fontSize: isTablet ? 20 : 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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