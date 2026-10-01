import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/hadith/hadith_tab.dart';
import 'package:islami/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami/ui/screens/home/tabs/radio/screen/radio_tab.dart';
import 'package:islami/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/screens/home/tabs/time/screen/time_tab.dart';
import 'package:islami/ui/utilites/app_assets.dart';
import 'package:islami/ui/utilites/app_colors.dart';
import 'package:islami/ui/utilites/app_constant.dart';

import '../../utilites/app_scaffold.dart';

class HomeScreen extends StatefulWidget {
  // final SuraDM suraDM;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    QuranTab(suraDM: suras[12]),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Container buildBottomNavigationIcon(String path, bool selected) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? AppColors.black.withAlpha(153) : Colors.transparent,
        borderRadius: BorderRadius.circular(66),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      child: ImageIcon(AssetImage(path)),
    );
  }

  int selectedIndex = 0;

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.black,
      currentIndex: selectedIndex,
      selectedIconTheme: IconThemeData(size: 32),
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: buildBottomNavigationIcon(
            AppAssets.icQuran,
            selectedIndex == 0,
          ),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavigationIcon(
            AppAssets.icHadeth,
            selectedIndex == 1,
          ),
          label: "Hadeth",
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavigationIcon(
            AppAssets.icSebha,
            selectedIndex == 2,
          ),
          label: "Sebha",
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavigationIcon(
            AppAssets.icRadio,
            selectedIndex == 3,
          ),
          label: "Radio",
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavigationIcon(AppAssets.icTime, selectedIndex == 4),
          label: "Time",
        ),
      ],
    );
  }
}
