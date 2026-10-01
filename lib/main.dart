import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/home_screen.dart';
import 'package:islami/ui/screens/onboarding/onboarding_screen.dart';
import 'package:islami/ui/screens/splash/splash_screen.dart';
import 'package:islami/ui/utilites/app_colors.dart';
import 'package:islami/ui/utilites/shared_pref_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: AppColors.gold),
      initialRoute: "SplashScreen",
      routes: {
        "SplashScreen": (_) => const SplashScreen(),
        "IntroScreen": (_) => const OnboardingScreen(),
        "HomeScreen": (_) => const HomeScreen(),
      },
    );
  }
}
