import 'package:flutter/cupertino.dart';
import 'package:islami/ui/utilites/app_assets.dart';
import 'package:islami/ui/utilites/app_constant.dart';
import 'package:islami/ui/utilites/app_text_style.dart';
import 'package:flutter/material.dart';

class ScreenView extends StatelessWidget {
  final PageController pageController;
  final ValueChanged<int> onPageChanged;
  final int currentPage;

  const ScreenView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: AppConstant.intro.length,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              final intro = AppConstant.intro[index];
              return SafeArea(
                child: Column(
                  children: [
                    Image.asset(
                      AppAssets.islamiTopScreen,
                      width: 291,
                      height: 171,
                    ),
                    const SizedBox(height: 50),
                    Image.asset(intro.imagePath, width: 398, height: 415),
                    const Spacer(),
                    Text(
                      intro.introHeading,
                      style: AppTextStyles.gold24Bold,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Text(
                      intro.introText,
                      style: AppTextStyles.gold20Bold,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
