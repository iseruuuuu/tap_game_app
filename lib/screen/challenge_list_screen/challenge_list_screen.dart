// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:tap_game_app/preference/share_preferenced.dart';
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
                  ? controller.onTapGameStart(
                      preferenceKey: PreferenceKey.level2,
                      count: 50,
                      keyword: 'あ',
                      level: 1,
                    )
                  : null,
              colors: controller.level1.value ? Colors.blueAccent : Colors.grey,
            ),
            Obx(
              () => ChallengeListButton(
                depth: controller.level2.value ? 0 : -20,
                title: 'Level2',
                onTap: () => controller.level2.value
                    ? controller.onTapGameStart(
                        preferenceKey: PreferenceKey.level3,
                        count: 70,
                        keyword: 'い',
                        level: 2,
                      )
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
                    ? controller.onTapGameStart(
                        preferenceKey: PreferenceKey.level4,
                        count: 90,
                        keyword: 'う',
                        level: 3,
                      )
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
                    ? controller.onTapGameStart(
                        preferenceKey: PreferenceKey.level5,
                        count: 110,
                        keyword: 'え',
                        level: 4,
                      )
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
                    ? controller.onTapGameStart(
                        preferenceKey: PreferenceKey.level999,
                        count: 130,
                        keyword: 'お',
                        level: 5,
                      )
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
                    ? controller.onTapGameStart(
                        preferenceKey: PreferenceKey.level999,
                        count: 400,
                        keyword: 'か',
                        level: 999,
                      )
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
