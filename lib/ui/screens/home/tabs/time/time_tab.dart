import 'package:flutter/cupertino.dart';

import '../../../../utilites/app_assets.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.red,
        image: DecorationImage(
          image: AssetImage(AppAssets.timeBackground),
          fit: BoxFit.fill,
          opacity: 0.5,
        ),
      ),
    );
  }
}
