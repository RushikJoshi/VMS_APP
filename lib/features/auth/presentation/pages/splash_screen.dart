import 'package:flutter/material.dart';
import 'dart:async';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const OnboardingScreen()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,


      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(

          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [

              Color(0xFFBBCFE4),
              Color(0xFFAECFF3),
              Color(0xFF8EABCC),

            ],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 20, spreadRadius: 5)],
                  ),
                  child: Icon(Icons.apartment, size: 80, color: Colors.blue.shade900),
                ),
                const SizedBox(height: 32),
                const Text(
                  'ENTERPRISE ERP',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Super Admin Gateway',
                  style: TextStyle(fontSize: 16, color: Colors.white70, letterSpacing: 1),
                ),
                const SizedBox(height: 48),
                //const CircularProgressIndicator(color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
