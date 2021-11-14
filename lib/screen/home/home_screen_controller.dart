import 'package:get/get.dart';
import 'package:tap_game_app/screen/game/game_screen.dart';
import 'package:tap_game_app/preference/share_preferenced.dart';

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

  void sharedPreference() async {
    level2.value = await Preference().getBool(PreferenceKey.level2);
    level3.value = await Preference().getBool(PreferenceKey.level3);
    level4.value = await Preference().getBool(PreferenceKey.level4);
    level5.value = await Preference().getBool(PreferenceKey.level5);
    level999.value = await Preference().getBool(PreferenceKey.level999);
  }

  onTapGameStart(int level, int count,String keyword) {
    Get.to(() => GameScreen(level: level, count: count, keyword: keyword));
  }
}
