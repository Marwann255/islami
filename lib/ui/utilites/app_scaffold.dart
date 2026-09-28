import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppScaffold extends StatelessWidget {
  final Widget? bottomNavigationBar;
  final Widget body;
  final PreferredSizeWidget? appBar;

  const AppScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      appBar: appBar,
    );
  }
}
