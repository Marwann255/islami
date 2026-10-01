import 'package:islami/ui/screens/home/tabs/quran/sura_dm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:islami/ui/utilites/app_constant.dart';

class SharedPrefService {
  static late SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<void> setSuraMostRecent(
    SuraDM sura,
    List<SuraDM> mostRecentList,
  ) async {
    if (mostRecentList.contains(sura)) mostRecentList.remove(sura);
    if (mostRecentList.length >= 5) mostRecentList.removeLast();
    mostRecentList.insert(0, sura);
    List<String> idList = [];
    for (var mostRecentSura in mostRecentList) {
      idList.add(mostRecentSura.index.toString());
    }
    await _pref.setStringList(AppConstant.mostRecentKey, idList);
  }

  static List<SuraDM> getMostRecentList() {
    final idList = _pref.getStringList(AppConstant.mostRecentKey) ?? [];
    return idList
        .map(int.tryParse)
        .whereType<int>()
        .where((id) => id >= 1 && id <= suras.length)
        .map((id) => suras[id - 1])
        .toList();
  }
}
