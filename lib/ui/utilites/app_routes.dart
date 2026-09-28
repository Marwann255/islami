import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/quran/sura_dm.dart';

import '../screens/home/home_screen.dart';
import '../screens/home/sura_detailed/sura_detailed_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';

abstract final class AppRoutes {
  static MaterialPageRoute<dynamic> introRoute() =>
      MaterialPageRoute(builder: (_) => OnboardingScreen());

  static MaterialPageRoute<dynamic> homeRoute() =>
      MaterialPageRoute(builder: (_) => HomeScreen());

  static MaterialPageRoute<dynamic> suraDetailedRoute(SuraDM sura) =>
      MaterialPageRoute(builder: (_) => SuraDetailedScreen(suraDM: sura));
}
