import 'package:flutter/cupertino.dart';
import 'package:islami/ui/screens/home/tabs/quran/sura_dm.dart';

import '../../../../../utilites/app_assets.dart';
import '../../../../../utilites/app_colors.dart';
import '../../../../../utilites/app_text_style.dart';

class MostRecentWidget extends StatelessWidget {
  final SuraDM suraDM;
  const MostRecentWidget({super.key, required this.suraDM});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width * .7,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.gold, borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suraDM.suraNameEn,
                  style: AppTextStyles.black24Bold,
                ),
                Text(
                  suraDM.suraNameAr,
                  style: AppTextStyles.black24Bold,
                ),
                Text(
                  "${suraDM.verse} verses",
                  style: AppTextStyles.black14Bold,
                )
              ],
            ),
          ),
          Image.asset(AppAssets.imgMostRecent)
        ],
      ),
    );
  }
}
