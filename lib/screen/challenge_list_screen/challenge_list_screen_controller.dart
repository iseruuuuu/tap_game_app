// Flutter imports:
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
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

  void onTapBack() {
    Get.back();
  }



  onTapGameStart(int level, int count, String keyword) {
    Get.to(() => GameScreen(level: level, keyword: keyword));
  }
}
