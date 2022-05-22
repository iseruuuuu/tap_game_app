// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:tap_game_app/screen/challenge_list_screen/children/challenge_list_button.dart';

// Project imports:
import 'challenge_list_screen_controller.dart';

class ChallengeListScreen extends StatelessWidget {
  const ChallengeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChallengeScreenController(), tag: '');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          iconSize: 35,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blueAccent,
          ),
          onPressed: controller.onTapBack,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ChallengeListButton(
              depth: controller.level1.value ? 0 : -20,
              title: 'Level1',
              onTap: () => controller.level1.value
                  ? controller.onTapGameStart(1, 50, 'あ')
                  : null,
              colors: controller.level1.value ? Colors.blueAccent : Colors.grey,
            ),
            Obx(
              () => ChallengeListButton(
                depth: controller.level2.value ? 0 : -20,
                title: 'Level2',
                onTap: () => controller.level2.value
                    ? controller.onTapGameStart(2, 70, 'い')
                    : null,
                colors:
                    controller.level2.value ? Colors.blueAccent : Colors.grey,
              ),
            ),
            Obx(
              () => ChallengeListButton(
                depth: controller.level3.value ? 0 : -20,
                title: 'Level3',
                onTap: () => controller.level3.value
                    ? controller.onTapGameStart(3, 90, 'う')
                    : null,
                colors:
                    controller.level3.value ? Colors.blueAccent : Colors.grey,
              ),
            ),
            Obx(
              () => ChallengeListButton(
                depth: controller.level4.value ? 0 : -20,
                title: 'Level4',
                onTap: () => controller.level4.value
                    ? controller.onTapGameStart(4, 110, 'え')
                    : null,
                colors:
                    controller.level4.value ? Colors.blueAccent : Colors.grey,
              ),
            ),
            Obx(
              () => ChallengeListButton(
                depth: controller.level5.value ? 0 : -20,
                title: 'Level5',
                onTap: () => controller.level5.value
                    ? controller.onTapGameStart(5, 130, 'お')
                    : null,
                colors:
                    controller.level5.value ? Colors.blueAccent : Colors.grey,
              ),
            ),
            Obx(
              () => ChallengeListButton(
                depth: controller.level999.value ? 0 : -20,
                title: 'Level999',
                onTap: () => controller.level999.value
                    ? controller.onTapGameStart(999, 400, 'か')
                    : null,
                colors:
                    controller.level999.value ? Colors.blueAccent : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
