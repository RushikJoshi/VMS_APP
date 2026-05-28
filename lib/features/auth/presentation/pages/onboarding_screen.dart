import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
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
      'desc':
      'Seamlessly onboard and manage SaaS clients and their massive enterprise ecosystems.',
    },
    {
      "image": "assets/images/onboarding2.png",
      'title': 'Track Logistics',
      'desc':
      'Monitor real-time shipments, verify GRN, and keep the supply chain flowing.',
    },
    {
      "image": "assets/images/onboarding3.png",
      'title': 'Financial Analytics',
      'desc':
      'Deep-dive into revenue graphs, subscriptions, and massive procurement RFQs.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    bool isTablet = screenWidth > 600;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -screenHeight * 0.12,
            left: -screenWidth * 0.20,
            child: _CircleShape(
              size: screenWidth * 0.6,
              color: AppColors.gradient3,
            ),
          ),

          Positioned(
            bottom: -screenHeight * 0.12,
            right: -screenWidth * 0.20,
            child: _CircleShape(
              size: screenWidth * 0.6,
              color: AppColors.gradient3,
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: screenHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    /// PAGEVIEW
                    SizedBox(
                      height: screenHeight * 0.58,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _onboardingData.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          final data = _onboardingData[index];

                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.08,
                              vertical: screenHeight * 0.02,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                /// IMAGE
                                Image.asset(
                                  data["image"] as String,
                                  height: isTablet
                                      ? screenHeight * 0.28
                                      : screenHeight * 0.22,
                                  fit: BoxFit.contain,
                                ),

                                SizedBox(height: screenHeight * 0.05),

                                /// TITLE
                                Text(
                                  data['title'] as String,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: isTablet ? 34 : 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),

                                SizedBox(height: screenHeight * 0.025),

                                /// DESCRIPTION
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.03,
                                  ),
                                  child: Text(
                                    data['desc'] as String,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: isTablet ? 20 : 16,
                                      color: Colors.black54,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    /// DOT INDICATOR
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _onboardingData.length,
                            (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.01,
                          ),
                          height: 8,
                          width: _currentPage == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.blue.shade900
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.05),

                    /// BUTTON
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.08,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: isTablet ? 65 : 56,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentPage ==
                                _onboardingData.length - 1) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                              );
                            } else {
                              _pageController.nextPage(
                                duration:
                                const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            AppColors.buttonPrimary,
                            elevation: 0,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            _currentPage ==
                                _onboardingData.length - 1
                                ? 'Get Started'
                                : 'Next',
                            style: TextStyle(
                              fontSize: isTablet ? 22 : 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.015),

                    /// SKIP BUTTON
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: isTablet ? 24 : 20,
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// CIRCLE SHAPE
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