import 'package:get/get.dart';
import 'package:tap_game_app/screen/game/game_screen.dart';
import 'package:tap_game_app/preference/share_preferenced.dart';

class HomeScreenController extends GetxController {
  var level1 = true.obs;
  var level2 = false.obs;
  var level3 = false.obs;

  @override
  void onInit() {
    super.onInit();
    sharedPreference();
  }

  void sharedPreference() async {
    var stage2 = await Preference().getBool(PreferenceKey.level2);
    level2.value = stage2;

    level3.value = await Preference().getBool(PreferenceKey.level3);

  }

  onTapGameStart() {
    Get.to(() => const GameScreen());
  }
}
