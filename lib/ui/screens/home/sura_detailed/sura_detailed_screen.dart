import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/screens/home/tabs/quran/sura_dm.dart';
import 'package:islami/ui/utilites/app_assets.dart';
import 'package:islami/ui/utilites/app_colors.dart';
import 'package:islami/ui/utilites/app_scaffold.dart';
import 'package:islami/ui/utilites/app_text_style.dart';

class SuraDetailedScreen extends StatefulWidget {
  final SuraDM suraDM;

  const SuraDetailedScreen({super.key, required this.suraDM});

  @override
  State<SuraDetailedScreen> createState() => _SuraDetailedScreenState();
}

class _SuraDetailedScreenState extends State<SuraDetailedScreen> {
  String suraContent = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readSuraContent();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.gold),
        title: Text(widget.suraDM.suraNameEn, style: AppTextStyles.gold20Bold),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppAssets.suraDetailsLeft),
              Center(
                child: Text(
                  widget.suraDM.suraNameAr,
                  style: AppTextStyles.gold24Bold,
                ),
              ),
              Image.asset(AppAssets.suraDetailsRight),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Text(
                  suraContent,
                  style: AppTextStyles.gold20Bold,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Image.asset(AppAssets.suraDetailsBottom),
        ],
      ),
    );
  }

  Future<void> readSuraContent() async {
    String fileName = "assets/files/Suras/${widget.suraDM.index}.txt";
    Future<String> future = rootBundle.loadString(fileName);
    suraContent = await future;
    List<String> lines = suraContent.split("\n");
    for (int i = 0; i < lines.length; i++) {
      lines[i] += "{${i + 1}}";
    }
    suraContent = lines.join();
    setState(() {});
  }
}
