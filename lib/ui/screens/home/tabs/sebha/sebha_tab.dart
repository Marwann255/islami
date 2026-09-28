import 'package:flutter/cupertino.dart';
import 'package:islami/ui/screens/home/tabs/sebha/sebha_counter.dart';
import 'package:islami/ui/utilites/app_text_style.dart';

import '../../../../utilites/app_assets.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.sebhaBackground),
          fit: BoxFit.fill,
          opacity: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 0,
            child: SafeArea(child: Image.asset(AppAssets.islamiTopScreen)),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: Text(
                  "سَبِّحِ باسْمَ رَبِّكَ الأعلى ",
                  style: AppTextStyles.white38w700,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            flex: 10,
            child: SebhaCounter(),
            // Container(
            //   margin: EdgeInsets.only(bottom: 92),
            //   child: GestureDetector(
            //     onTapDown: (details) =>
            //         AnimatedRotation(turns: 1, duration: Duration(seconds: 60),),
            //     child: SvgPicture.asset(
            //       AppAssets.sebha,
            //       colorFilter: ColorFilter.mode(
            //         AppColors.gold,
            //         BlendMode.srcIn,
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
