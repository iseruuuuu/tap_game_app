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
}

class Preference {
  final preference = SharedPreferences.getInstance();

  Future<bool> getBool(PreferenceKey key) async {
    final pref = await preference;
    final value = pref.getBool(EnumToString.convertToString(key)) ?? true;
    return value;
  }

  Future<void> setBool(PreferenceKey key, bool value) async {
    final pref = await preference;
    await pref.setBool(EnumToString.convertToString(key), value);
  }
}
