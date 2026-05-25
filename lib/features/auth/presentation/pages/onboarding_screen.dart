import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      "image": "assets/images/onboarding1.png",
      'title': 'Manage Companies',
      'desc': 'Seamlessly onboard and manage SaaS clients and their massive enterprise ecosystems.',
    },
    {
      "image": "assets/images/onboarding2.png",

      'title': 'Track Logistics',
      'desc': 'Monitor real-time shipments, verify GRN, and keep the supply chain flowing.',
    },
    {
      "image": "assets/images/onboarding3.png",

      'title': 'Financial Analytics',
      'desc': 'Deep-dive into revenue graphs, subscriptions, and massive procurement RFQs.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5FAFF),
      body: Stack(

        children: [
          Positioned(
            top: -100,
            left: -80,
            child: _CircleShape(
              size: 250,

              color: const Color(0xFF769DED),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -80,
            child: _CircleShape(
              size: 250,
              color: const Color(0xFF769DED),
            ),
          ),


          SafeArea(
            child: Column(

              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _onboardingData.length,
                    itemBuilder: (context, index) {
                      final data = _onboardingData[index];
                      return Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              data["image"] as String,
                              height: screenHeight * 0.15,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 48),
                            Text(
                              data['title'] as String,
                              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              data['desc'] as String,
                              style: const TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onboardingData.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _currentPage == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index ? Colors.blue.shade900 : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage == _onboardingData.length - 1) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                        } else {
                          _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        //backgroundColor: Colors.blue.shade900,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: Text(
                        _currentPage == _onboardingData.length - 1 ? 'Get Started' : 'Next',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                  },
                  child: const Text('Skip', style: TextStyle(color: Colors.grey, fontSize: 20)),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
///circle shape using =====================
class _CircleShape extends StatelessWidget {
  final double size;
  final Color color;

  const _CircleShape({
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color.withOpacity(.75),
        shape: BoxShape.circle,
      ),
    );
  }
}
