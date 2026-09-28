import 'package:flutter/material.dart';

import '../../../../utilites/app_assets.dart';
import '../../../../utilites/app_text_style.dart';

class SebhaCounter extends StatefulWidget {
  const SebhaCounter({super.key});

  @override
  State<SebhaCounter> createState() => _SebhaCounterState();
}

class _SebhaCounterState extends State<SebhaCounter> {
  int _count = 0;
  int _phraseIndex = 0;
  final List _tasbehText = ["سبحان الله", "الحمدالله", "الله اكبر"];

  void _onTap() {
    setState(() {
      _count++;
      if (_count >= 33) {
        _count = 0;
        _phraseIndex = (_phraseIndex + 1) % _tasbehText.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: _onTap,
          child: Stack(
            children: [
              Center(child: Image.asset(AppAssets.sebhaBody)),
              Positioned(
                left: screenWidth * .33,
                top: screenHeight * .15,
                child: Text(
                  _tasbehText[_phraseIndex],
                  style: AppTextStyles.white38w700,
                ),
              ),
              Positioned(
                left: screenWidth * .46,
                top: screenHeight * .22,
                child: Text(
                  '$_count',
                  style: AppTextStyles.white16Bold.copyWith(fontSize: 32),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
