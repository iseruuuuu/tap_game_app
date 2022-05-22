import 'package:get/get.dart';
import 'package:tap_game_app/preference/share_preferenced.dart';
import 'package:tap_game_app/screen/challenge_list_screen/challenge_list_screen.dart';
import 'package:tap_game_app/screen/game_30_screen/game_30_screen.dart';
import 'package:tap_game_app/screen/setting_screen/setting_screen.dart';

class HomeScreenController extends GetxController {
  var level1 = true.obs;
  var level2 = false.obs;
  var level3 = false.obs;
  var level4 = false.obs;
  var level5 = false.obs;
  var level999 = false.obs;

  @override
  void onInit() {
    super.onInit();
    sharedPreference();
  }

  void onTap30() {
    //TODO 後で記載が必要
    Get.to(() => const Game30Screen(level: 0, keyword: ''));
  }

  void onTapChallenge() {
    Get.to(() => const ChallengeListScreen());
  }

  void onTapSetting() {
    Get.to(() => const SettingScreen());
  }

  void sharedPreference() async {
    level2.value = await Preference().getBool(PreferenceKey.level2);
    level3.value = await Preference().getBool(PreferenceKey.level3);
    level4.value = await Preference().getBool(PreferenceKey.level4);
    level5.value = await Preference().getBool(PreferenceKey.level5);
    level999.value = await Preference().getBool(PreferenceKey.level999);
  }
}
