import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap_game_app/screen/home/home_screen_controller.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
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
              onTap: () =>
                  controller.level1.value ? controller.onTapGameStart() : null,
              colors: controller.level1.value ? Colors.red : Colors.grey,
            ),
            const SizedBox(height: 20),
            TitleButton(
              depth: controller.level2.value ? 0 : -20,
              title: 'Level2',
              onTap: () =>
                  controller.level2.value ? controller.onTapGameStart() : null,
              colors: controller.level2.value ? Colors.red : Colors.grey,
            ),
            const SizedBox(height: 20),
            TitleButton(
              depth: controller.level3.value ? 0 : -20,
              title: 'Level3',
              onTap: () =>
                  controller.level3.value ? controller.onTapGameStart() : null,
              colors: controller.level3.value ? Colors.red : Colors.grey,
            ),
            const SizedBox(height: 20),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class TitleButton extends StatelessWidget {
  const TitleButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.colors,
    required this.depth,
  }) : super(key: key);

  final String title;
  final Function() onTap;
  final Color colors;
  final double depth;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        depth: depth,
        color: colors,
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }
}
