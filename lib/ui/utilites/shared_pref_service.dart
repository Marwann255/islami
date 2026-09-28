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

  static Future<void> getMostRecentList(List<SuraDM> mostRecentList) async {
    _pref.clear();
    List<String> idList = _pref.getStringList(AppConstant.mostRecentKey) ?? [];
    for (int i = 0; i < suras.length; i++) {
      int id = int.parse(idList[i]);
      mostRecentList.add(suras[id - 1]);
    }
  }
}
