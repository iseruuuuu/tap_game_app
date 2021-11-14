import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap_game_app/conponent/title_button.dart';
import 'package:tap_game_app/screen/home/home_screen_controller.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController(),tag: 'ああ');
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            NeumorphicText(
              '連打ゲーム',
              textStyle: NeumorphicTextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            NeumorphicText(
              'Mash Game',
              textStyle: NeumorphicTextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TitleButton(
              depth: controller.level1.value ? 0 : -20,
              title: 'Level1',
              onTap: () => controller.level1.value
                  ? controller.onTapGameStart(1, 50, 'あ')
                  : null,
              colors: controller.level1.value ? Colors.red : Colors.grey,
            ),
            const SizedBox(height: 20),
            Obx(() => TitleButton(
                depth: controller.level2.value ? 0 : -20,
                title: 'Level2',
                onTap: () => controller.level2.value
                    ? controller.onTapGameStart(2, 70, 'い')
                    : null,
                colors: controller.level2.value ? Colors.red : Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => TitleButton(
                depth: controller.level3.value ? 0 : -20,
                title: 'Level3',
                onTap: () => controller.level3.value
                    ? controller.onTapGameStart(3, 90, 'う')
                    : null,
                colors: controller.level3.value ? Colors.red : Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => TitleButton(
                depth: controller.level4.value ? 0 : -20,
                title: 'Level4',
                onTap: () => controller.level4.value
                    ? controller.onTapGameStart(4, 110, 'え')
                    : null,
                colors: controller.level4.value ? Colors.red : Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => TitleButton(
                depth: controller.level5.value ? 0 : -20,
                title: 'Level5',
                onTap: () => controller.level5.value
                    ? controller.onTapGameStart(5, 130, 'お')
                    : null,
                colors: controller.level5.value ? Colors.red : Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => TitleButton(
                depth: controller.level999.value ? 0 : -20,
                title: 'Level999',
                onTap: () => controller.level999.value
                    ? controller.onTapGameStart(999, 200, 'か')
                    : null,
                colors: controller.level999.value ? Colors.red : Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
