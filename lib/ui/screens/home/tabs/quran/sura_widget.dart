import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/quran/sura_dm.dart';
import 'package:islami/ui/utilites/app_routes.dart';
import 'package:islami/ui/utilites/app_text_style.dart';

import '../../../../utilites/app_assets.dart';

class SuraWidget extends StatelessWidget {
  final SuraDM sura;
  final void Function() onSuraClicked;

  const SuraWidget({required this.sura, super.key, required this.onSuraClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, AppRoutes.suraDetailedRoute(sura));
        onSuraClicked();
      },
      child: Row(
        children: [
          buildSuraNumber(),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sura.suraNameEn, style: AppTextStyles.white20Bold),
                Text("${sura.verse} Verses", style: AppTextStyles.white14Bold),
              ],
            ),
          ),
          Text(sura.suraNameAr, style: AppTextStyles.white20Bold),
        ],
      ),
    );
  }

  Container buildSuraNumber() {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.suraListNum),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Text(sura.index.toString(), style: AppTextStyles.white20Bold),
      ),
    );
  }
}
