import 'package:flutter/cupertino.dart';

import '../../../../utilites/app_assets.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.red,
        image: DecorationImage(
          image: AssetImage(AppAssets.radioBackground),
          fit: BoxFit.fill,
          opacity: 0.5,
        ),
      ),
    );
  }
}
