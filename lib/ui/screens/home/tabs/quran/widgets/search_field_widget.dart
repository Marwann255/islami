import 'package:flutter/material.dart';

import '../../../../../utilites/app_assets.dart';
import '../../../../../utilites/app_colors.dart';
import '../../../../../utilites/app_text_style.dart';

class SearchFieldWidget extends StatelessWidget {
  final Function(String) onChanged;

  const SearchFieldWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: AppColors.gold,
      style: AppTextStyles.white16Bold,
      decoration: InputDecoration(
        labelText: "Sura Name",
        labelStyle: AppTextStyles.white14Bold,
        filled: true,
        fillColor: AppColors.black.withOpacity(0.8),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: AppColors.gold),
        ),
        prefixIcon: ImageIcon(
          AssetImage(AppAssets.icQuran),
          color: AppColors.gold,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: AppColors.gold),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: AppColors.gold),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: AppColors.gold),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: AppColors.red),
        ),
      ),
    );
  }
}
