import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/screens/home/tabs/hadith/hadeth_dm.dart';
import 'package:islami/ui/utilites/app_colors.dart';
import 'package:islami/ui/utilites/app_text_style.dart';

import '../../../../utilites/app_assets.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // color: Colors.red,
        image: DecorationImage(
          image: AssetImage(AppAssets.hadethBackground),
          fit: BoxFit.fill,
          opacity: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.islamiTopScreen),
          Expanded(
            child: CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: false,
                height: double.infinity,
                enlargeCenterPage: true,
                reverse: true,
              ),
              itemCount: 50,
              itemBuilder: (context, index, realIndex) {
                // print("index: $index, realIndex: $realIndex");
                return HadethCard(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HadethCard extends StatefulWidget {
   final int index ;

  HadethCard({super.key, required this.index});

  @override
  State<HadethCard> createState() => _HadethCardState();
}

class _HadethCardState extends State<HadethCard> {
  HadethDm hadethDm = HadethDm(hadethContent: "", title: "");

  @override
  void initState() {
    readHadethVContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: const EdgeInsets.only(bottom: 12),
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppAssets.suraDetailsLeft,
                    color: AppColors.black,
                    // width: 92,
                  ),
                  Expanded(
                    child: Text(
                      hadethDm.title,
                      style: AppTextStyles.black24Bold,
                      textAlign: .center,
                    ),
                  ),
                  Image.asset(
                    AppAssets.suraDetailsRight,
                    color: AppColors.black,
                    // width: 92,
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Text(
                  hadethDm.hadethContent,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.black16Bold,
                ),
              ),
            ),
          ),
          Image.asset(AppAssets.suraDetailsBottom, color: AppColors.black),
        ],
      ),
    );
  }

  Future<void> readHadethVContent() async {
    String fileName = "assets/files/Hadeeth/h${widget.index+1}.txt";
    final String fileContent = await rootBundle.loadString(fileName);
    final List<String> lines = fileContent.split('\n');
    final title = lines[0];
    lines.removeAt(0);
    final String hadethContent = lines.join('');
    hadethDm = HadethDm(hadethContent: hadethContent, title: title);
    setState(() {});
  }
}
