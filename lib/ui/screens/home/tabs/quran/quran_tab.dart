import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/quran/quran_widget/most_recent_widget.dart';
import 'package:islami/ui/screens/home/tabs/quran/sura_dm.dart';
import 'package:islami/ui/screens/home/tabs/quran/sura_widget.dart';
import 'package:islami/ui/screens/home/tabs/quran/widgets/search_field_widget.dart';
import 'package:islami/ui/utilites/app_constant.dart';
import 'package:islami/ui/utilites/app_scaffold.dart';
import 'package:islami/ui/utilites/shared_pref_service.dart';

import '../../../../utilites/app_assets.dart';
import '../../../../utilites/app_text_style.dart';

class QuranTab extends StatefulWidget {
  final SuraDM suraDM;

  const QuranTab({super.key, required this.suraDM});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraDM> searchableList = [];
  List<SuraDM> mostRecentList = [];
  String searchText = "";

  @override
  void initState() {
    super.initState();
    for (var sura in suras) {
      searchableList.add(sura);
    }
    SharedPrefService.getMostRecentList();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.quranBackground),
            fit: BoxFit.fill,
            opacity: 0.5,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(child: Image.asset(AppAssets.islamiTopScreen)),
            const SizedBox(height: 10),
            SearchFieldWidget(onChanged: _search),
            const SizedBox(height: 30),
            if (searchText.isEmpty) ...[
              if (mostRecentList.isNotEmpty) ...[
                Text("Most Recently", style: AppTextStyles.white16Bold),
                const SizedBox(height: 10),
                Expanded(flex: 42, child: buildMostRecentListView()),
              ],
              const SizedBox(height: 10),
              Text("Sura List", style: AppTextStyles.white16Bold),
            ],
            // const SizedBox(height: 10),
            Expanded(
              flex: 58,
              child: searchText.isNotEmpty && searchableList.isEmpty
                  ? Center(
                      child: Text(
                        'No sura found has name: $searchText',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : buildSuraListView(),
            ),
          ],
        ),
      ),
    );
  }

  ListView buildMostRecentListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mostRecentList.length,
      itemBuilder: (context, index) {
        return MostRecentWidget(suraDM: mostRecentList[index]);
      },
    );
  }

  ListView buildSuraListView() {
    return ListView.separated(
      itemCount: searchableList.length,
      separatorBuilder: (_, index) {
        return Divider(thickness: 2, indent: 50, endIndent: 50);
      },
      itemBuilder: (_, index) {
        return SuraWidget(
          sura: searchableList[index],
          onSuraClicked: () {
            SharedPrefService.setSuraMostRecent(
              searchableList[index],
              mostRecentList,
            );
            setState(() {});
          },
        );
      },
    );
  }

  void _search(String suraName) {
    searchText = suraName;
    searchableList = suras
        .where(
          (sura) =>
              sura.suraNameEn.toLowerCase().contains(suraName.toLowerCase()) ||
              sura.suraNameAr.contains(suraName),
        )
        .toList();
    setState(() {});
  }
}
