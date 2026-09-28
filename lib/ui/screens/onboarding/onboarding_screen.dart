import 'package:flutter/material.dart';
import 'package:islami/ui/screens/onboarding/screen_view.dart';

import '../../utilites/app_colors.dart';
import '../../utilites/app_constant.dart';
import '../../utilites/app_scaffold.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < AppConstant.intro.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        "HomeScreen",
        (route) => false,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Expanded(
            child: ScreenView(
              pageController: _pageController,
              onPageChanged: ((index) => setState(() {
                _currentPage = index;
              })),
              currentPage: _currentPage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),

            child: Row(
              children: [
                TextButton(
                  onPressed: _previousPage,
                  child: Text(
                    _currentPage == 0 ? "" : "Back",
                    style: const TextStyle(color: AppColors.gold, fontSize: 16),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    ...List.generate(
                      AppConstant.intro.length,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 6),
                        width: _currentPage == index ? 16 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: _currentPage == index
                              ? AppColors.gold
                              : Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: _nextPage,
                  child: Text(
                    _currentPage == AppConstant.intro.length - 1
                        ? "Get Started"
                        : "Next",
                    style: const TextStyle(color: AppColors.gold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
