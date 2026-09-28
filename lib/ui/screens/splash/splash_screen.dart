import 'package:flutter/material.dart';
import 'package:islami/ui/utilites/app_routes.dart';

import '../../utilites/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.pushReplacement(context, AppRoutes.introRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Image.asset(
                  AppAssets.splashBackground,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Center(child: Image.asset(AppAssets.islamiLogo, width: 173.72)),
          Positioned(
            right: 0,
            top: 604,
            child: Image.asset(AppAssets.shapeRight, width: 101),
          ),
          Positioned(
            left: 0,
            top: 214,
            child: Image.asset(AppAssets.shapeLeft, width: 87),
          ),
          Positioned(left: 329, child: Image.asset(AppAssets.glow, width: 88)),
          Positioned(
            top: 57,
            left: 69,
            child: Image.asset(AppAssets.topSplash, width: 291),
          ),
          Positioned(
            top: 792,
            left: 93,
            child: Image.asset(AppAssets.icBottomSplash, width: 244),
          ),
        ],
      ),
    );
  }
}
