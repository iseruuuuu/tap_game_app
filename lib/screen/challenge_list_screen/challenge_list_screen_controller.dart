// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:tap_game_app/preference/share_preferenced.dart';
import 'package:tap_game_app/screen/game_screen/game_screen.dart';

// Project imports:

class ChallengeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin, WidgetsBindingObserver, RouteAware {
  var level1 = true.obs;
  var level2 = false.obs;
  var level3 = false.obs;
  var level4 = false.obs;
  var level5 = false.obs;
  var level999 = false.obs;

  @override
  void onInit() {
    super.onInit();
    getPreference();
  }

  void getPreference() async {
    level2.value = await Preference().getBool(PreferenceKey.level2);
    level3.value = await Preference().getBool(PreferenceKey.level3);
    level4.value = await Preference().getBool(PreferenceKey.level4);
    level5.value = await Preference().getBool(PreferenceKey.level5);
    level999.value = await Preference().getBool(PreferenceKey.level999);
  }

  void onTapBack() {
    Get.back();
  }

  onTapGameStart({
    required int level,
    required int count,
    required String keyword,
    required PreferenceKey preferenceKey,
  }) {
    Get.to(
      () => GameScreen(
        level: level,
        keyword: keyword,
        preferenceKey: preferenceKey,
      ),
    );
  }
}
