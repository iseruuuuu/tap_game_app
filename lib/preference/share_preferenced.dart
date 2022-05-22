import 'package:enum_to_string/enum_to_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PreferenceKey {
  //Revel2
  level2,
  //Revel3
  level3,
  //Revel4
  level4,
  //Revel5
  level5,
  //Revel999
  level999,
  //ハイスコア
  highScore,
}

class Preference {
  final preference = SharedPreferences.getInstance();

  Future<bool> getBool(PreferenceKey key) async {
    final pref = await preference;
    final value = pref.getBool(EnumToString.convertToString(key)) ?? false;
    return value;
  }

  Future<void> setBool(PreferenceKey key, bool value) async {
    final pref = await preference;
    await pref.setBool(EnumToString.convertToString(key), value);
  }

  Future<int> getInt(PreferenceKey key) async {
    final pref = await preference;
    final value = pref.getInt(EnumToString.convertToString(key)) ?? 0;
    return value;
  }

  Future<void> setInt(PreferenceKey key, int value) async {
    final pref = await preference;
    await pref.setInt(EnumToString.convertToString(key), value);
  }
}
